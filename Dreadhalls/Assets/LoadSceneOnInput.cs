using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoadSceneOnInput : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		Scene activeScene = SceneManager.GetActiveScene();
		string scene = activeScene.name;

		if (Input.GetAxis("Submit") == 1 && scene == "Title") {
			SceneManager.LoadScene("Play");
		}
		else if (Input.GetAxis("Submit") == 1 && scene == "Endgame") {
			Destroy(GameObject.Find("WhisperSource"));
			SceneManager.LoadScene("Title");
		}
	}
}
