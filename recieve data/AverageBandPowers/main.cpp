/****************************************************************************
**
** Copyright 2015 by Emotiv. All rights reserved
** Example - AverageBandPowers
** The average band power for a specific channel from the latest epoch with
** 0.5 seconds step size and 2 seconds window size
** This example is used for single connection.
**
****************************************************************************/

//Brainwave Recognition System based on user's emotion

#ifdef __cplusplus


#ifdef _WIN32
#include <conio.h>
#include <windows.h>
#endif
#if __linux__ || __APPLE__
#include <unistd.h>
#endif

#include <iostream>
#include <string>
#include <fstream>
//#include<ctime>
#include <wchar.h> 
extern "C"
{
#endif

#include "IEmoStateDLL.h"
#include "Iedk.h"
#include "IedkErrorCode.h"

	using namespace std;

#if __linux__ || __APPLE__
	int _kbhit(void);
#endif
#ifdef __APPLE__
	int _kbhit(void)
	{
		struct timeval tv;
		fd_set rdfs;

		tv.tv_sec = 0;
		tv.tv_usec = 0;

		FD_ZERO(&rdfs);
		FD_SET(STDIN_FILENO, &rdfs);

		select(STDIN_FILENO + 1, &rdfs, NULL, NULL, &tv);
		return FD_ISSET(STDIN_FILENO, &rdfs);
	}
#endif

	//------------------------------------------------------------------------------
	//string surname_user = "Test";
	//string lastname_user = "Ttest";
	//string bod_user = "1Jan2000";
	//string gender_user = "M";

	string nameOfFile = "Test";
	//------------------------------------------------------------------------------

	SYSTEMTIME time;
	int  main()
	{

		EmoEngineEventHandle eEvent = IEE_EmoEngineEventCreate();
		EmoStateHandle eState = IEE_EmoStateCreate();

		unsigned int userID = 0;
		bool ready = false;
		int state = 0;

		//HeadsetInformationLogger
		IEE_EEG_ContactQuality_t* contactQuality = new IEE_EEG_ContactQuality_t;
		float systemUpTime = 0;
		int batteryLevel, maxBatteryLevel = 0;
		IEE_SignalStrength_t wirelessStrength;
		//end HeadsetInformationLogger
		//IEE_DataChannel_t channelList[] = { IED_AF3, IED_AF4, IED_T7, IED_T8, IED_Pz };
		IEE_DataChannel_t channelList[] = { IED_F7, IED_F8, IED_AF3, IED_AF4, IED_F3, IED_F4, IED_FC5, IED_FC6, IED_T7, IED_T8, IED_P7, IED_P8, IED_O1, IED_O2 };

#ifndef __APPLE__
		//std::string ouputFile = surname_user + "_" + lastname_user + "_" + bod_user + "_" + gender_user + ".txt";
		std::string ouputFile = nameOfFile + ".txt";
#else
		std::string home_path;
		const char* home = getenv("HOME");
		home_path.assign(home);
		home_path.append("/Desktop/AverageBandPowers.csv");
		std::string ouputFile = home_path;
#endif
		const char header[] = "Theta, Alpha, Low_beta, High_beta, Gamma";
		std::ofstream ofs(ouputFile.c_str(), std::ios::trunc);

		//ofs << "Time, Wireless Strength, Battery Level, T7, T8, ";
		//ofs << "Channel, "<< header << std::endl;

		if (IEE_EngineConnect() != EDK_OK) {
			std::cout << "Emotiv Driver start up failed.";
			return -1;
		}

		std::cout << "==================================================================="
			<< std::endl;
		std::cout << "Welcome to \"Brainwave Recognition System\" based on user's emotion" << endl;
		//std::cout << Example to get the average band power for a specific channel from \n"
		//	         "the latest epoch "
		//	      << std::endl;
		std::cout << "==================================================================="
			<< std::endl;

		while (!_kbhit())
		{
			state = IEE_EngineGetNextEvent(eEvent);

			if (state == EDK_OK)
			{
				IEE_Event_t eventType = IEE_EmoEngineEventGetType(eEvent);
				IEE_EmoEngineEventGetUserId(eEvent, &userID);

				/*if (eventType == IEE_UserAdded) {
				std::cout << "User added" << std::endl;
				IEE_FFTSetWindowingType(userID, IEE_HAMMING);

				std::cout << header << std::endl;
				ready = true;
				}*/

				//HeadsetInformationLogger
				switch (eventType)
				{
				case IEE_UserAdded:
					std::cout << "User added" << std::endl;
					IEE_FFTSetWindowingType(userID, IEE_HAMMING);
					std::cout << header << std::endl;
					ready = true;
					break;
				case IEE_UserRemoved:
					std::cout << "User removed" << std::endl;
					break;
				case IEE_EmoStateUpdated:
					ready = true;
					IEE_EmoEngineEventGetEmoState(eEvent, eState);
					break;
				default:
					break;
				}
				//end HeadsetInformationLogger
			}

			if (ready)
			{
				//HeadsetInformationLogger
				ready = false;
				systemUpTime = IS_GetTimeFromStart(eState);
				GetLocalTime(&time);
				wirelessStrength = IS_GetWirelessSignalStatus(eState);
				//end HeadsetInformationLogger

				double alpha, low_beta, high_beta, gamma, theta;
				alpha = low_beta = high_beta = gamma = theta = 0;

				//HeadsetInformationLogger
				if (wirelessStrength != NO_SIG)
				{
					//std::cout << "Time: " << systemUpTime << ",\t";
					std::cout << "Time " << time.wHour << ":" << time.wMinute << ":" << time.wSecond << ":" << time.wMilliseconds << " ";

					IS_GetBatteryChargeLevel(eState, &batteryLevel, &maxBatteryLevel);

					//Time, Wireless Strength, Battery Level, T7 Quality, T8 Quality
					ofs << time.wHour << ":" << time.wMinute << ":" << time.wSecond << ":" << time.wMilliseconds << ", ";

					ofs << wirelessStrength << ",";
					ofs << batteryLevel << ",";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_F7) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_F8) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_AF3) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_AF4) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_F3) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_F4) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_FC5) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_FC6) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_T7) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_T8) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_P7) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_P8) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_O1) << ", ";
					ofs << IS_GetContactQuality(eState, IEE_CHAN_O2) << ", ";

					//IED_F7, IED_F8, IED_AF3, IED_AF4, IED_F3, IED_F4, IED_FC5, IED_FC6, IED_T7, IED_T8, IED_P7, IED_P8, IED_O1, IED_O2

					cout << "wirelessStrength: " << wirelessStrength << ", ";
					//cout <<"batteryLevel: " << batteryLevel << ", ";
					cout << "F7: " << IS_GetContactQuality(eState, IEE_CHAN_F7) << ", ";
					cout << "F8: " << IS_GetContactQuality(eState, IEE_CHAN_F8) << ", ";
					//cout << "T7Quality: " << IS_GetContactQuality(eState, IEE_CHAN_AF3) << ", ";
					//cout << "T8Quality: " << IS_GetContactQuality(eState, IEE_CHAN_AF4) << ", ";
					//cout << "T7Quality: " << IS_GetContactQuality(eState, IEE_CHAN_F3) << ", ";
					//cout << "T8Quality: " << IS_GetContactQuality(eState, IEE_CHAN_F4) << ", ";
					//cout << "T7Quality: " << IS_GetContactQuality(eState, IEE_CHAN_FC5) << ", ";
					//cout << "T8Quality: " << IS_GetContactQuality(eState, IEE_CHAN_FC6) << ", ";
					cout << "T7: " << IS_GetContactQuality(eState, IEE_CHAN_T7) << ", ";
					cout << "T8: " << IS_GetContactQuality(eState, IEE_CHAN_T8) << ", ";
					//cout << "T7Quality: " << IS_GetContactQuality(eState, IEE_CHAN_P7) << ", ";
					//cout << "T8Quality: " << IS_GetContactQuality(eState, IEE_CHAN_P8) << ", ";
					//cout << "T7Quality: " << IS_GetContactQuality(eState, IEE_CHAN_O1) << ", ";
					//cout << "T8Quality: " << IS_GetContactQuality(eState, IEE_CHAN_O2) << endl;
					cout << endl;
				}
				//end HeadsetInformationLogger

				for (int i = 0; i< sizeof(channelList) / sizeof(channelList[0]); ++i)
				{
					int result = IEE_GetAverageBandPowers(userID, channelList[i], &theta, &alpha,
						&low_beta, &high_beta, &gamma);
					if (result == EDK_OK) {
						//Channel List, ch_theta, ch_alpha, ch_low_beta, ch_high_beta, ch_gamma 
						ofs << channelList[i] << ",";
						ofs << theta << ",";
						ofs << alpha << ",";
						ofs << low_beta << ",";
						ofs << high_beta << ",";
						ofs << gamma << ",";
						//ofs << std::endl;

						/*std::cout << "ChannelList: " << channelList[i] << ", ";
						std::cout << "Theta: " << theta << ", ";
						std::cout << "Alpha: " << alpha << ",";
						std::cout << "Low_beta: " << low_beta << ", ";
						std::cout << "High_beta: " << high_beta << ", ";
						std::cout << "Gamma: " << gamma << std::endl;*/
					}
				}
				ofs << std::endl;
			}

#ifdef _WIN32
			Sleep(1);
#endif
#if linux || __APPLE__
			usleep(10000);
#endif
		}

		ofs.close();

		IEE_EngineDisconnect();
		IEE_EmoStateFree(eState);
		IEE_EmoEngineEventFree(eEvent);
		return 0;
	}

#ifdef __linux__
	int _kbhit(void)
	{
		struct timeval tv;
		fd_set read_fd;

		tv.tv_sec = 0;
		tv.tv_usec = 0;

		FD_ZERO(&read_fd);
		FD_SET(0, &read_fd);

		if (select(1, &read_fd, NULL, NULL, &tv) == -1)
			return 0;

		if (FD_ISSET(0, &read_fd))
			return 1;

		return 0;
	}
#endif

#ifdef __cplusplus
}
#endif
