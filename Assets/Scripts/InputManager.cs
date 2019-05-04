using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InputManager : MonoBehaviour
{
    public bool actionButton;

    void Update()
    {
        actionButton = Input.anyKeyDown;
    }
}
