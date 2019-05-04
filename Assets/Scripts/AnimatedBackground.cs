using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimatedBackground : MonoBehaviour
{
    public Vector2 velocity;
    private Rigidbody2D _body;

    private void Awake()
    {
        _body = GetComponent<Rigidbody2D>();
    }

    private void FixedUpdate()
    {
        _body.velocity = velocity;

        if (transform.position.x < -12.8f)
        {
            transform.position = new Vector3(11.2f, transform.position.y, transform.position.z);
        }
    }
}
