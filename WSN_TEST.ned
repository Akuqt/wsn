//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

import inet.applications.udpapp.UdpBasicApp;
import inet.node.inet.Router;
import inet.node.internetcloud.InternetCloud;
import inet.flora.loraphy.LoRaMedium;
import inet.flora.loranode.LoRaNode;
import inet.flora.loranode.LoRaGW;
import inet.node.inet.StandardHost;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth1G;

@license(LGPL);
network WSN_TEST
{
    parameters:
        int networkSizeX = default(4000);
        int networkSizeY = default(2000);
        @display("bgi=background/map1;bgb=1203.192,736.84796");
    submodules:
        BLOQUE_K: LoRaNode {
            @display("p=226,177");
        }

        MESAS_A: LoRaNode {
            @display("p=241,389");
        }

        BAMBU_1: LoRaNode {
            @display("p=195,246");
        }

        BAMBU_2: LoRaNode {
            @display("p=173,152");
        }

        COLISEO: LoRaNode {
            @display("p=319,163");
        }

        PLAZA: LoRaNode {
            @display("p=370,360");
        }

        BIBLIOTECA: LoRaNode {
            @display("p=331,458");
        }

        EXPRESS: LoRaNode {
            @display("p=310,299");
        }

        BLOQUE_G: LoRaNode {
            @display("p=399,246");
        }

        MESAS_E: LoRaNode {
            @display("p=331,378");
        }

        MEDIA_TORTA: LoRaNode {
            @display("p=350,228");
        }

        GYM: LoRaNode {
            @display("p=331,204");
        }

        MESAS_B: LoRaNode {
            @display("p=240,350");
        }

        TERRASE: LoRaNode {
            @display("p=290,205");
        }

        CAFE_DUNORD: LoRaNode {
            @display("p=335,265");
        }

        GW: LoRaGW {
            @display("p=172,293;is=s");
        }
        LoRaMedium: LoRaMedium {
            @display("p=1010.86255,49.78875");
        }
        networkServer: StandardHost {
            parameters:
                @display("p=438.192,26.928");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                assignDisjunctSubnetAddresses = false;
                @display("p=1136.0887,51.2975");
        }
        internetCloud: InternetCloud {
            @display("p=226.44,26.928");
        }
        gwRouter: Router {
            @display("p=48.96,26.928");
        }
        nsRouter: Router {
            @display("p=331.704,26.928");
        }
    connections:
        networkServer.ethg++ <--> Eth1G <--> nsRouter.ethg++;
        nsRouter.pppg++ <--> Eth1G <--> internetCloud.pppg++;
        internetCloud.pppg++ <--> Eth1G <--> gwRouter.pppg++;
        gwRouter.ethg++ <--> Eth1G <--> GW.ethg++;

}
