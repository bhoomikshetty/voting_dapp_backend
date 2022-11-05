import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';

class IPFSServices {
  IpfsClient ipfsClient = IpfsClient();

  uploadIpfs() async {
    var res1 = await ipfsClient.write(
        dir: 'testpath3/Simulator.png',
        filePath: "C:\Users\Admin\Desktop\final_repo\voting_dapp_backend\assets\images",
        fileName: "background.jpg");
    var res2 = await ipfsClient.ls(dir: "testDir");
    print(res1.toString() + " " + res2.toString());
  }
}
