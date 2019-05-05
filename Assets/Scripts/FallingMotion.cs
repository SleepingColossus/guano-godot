using System;
using UnityEngine;

public class FallingMotion : MonoBehaviour
{
    private Rigidbody2D _body;
    private Animator _animator;
    
    public Vector2 velocity;
    public float angularVelocity;

    private void Start()
    {
        _body = GetComponent<Rigidbody2D>();
        _body.velocity = velocity;
        _body.angularVelocity = angularVelocity;

        _animator = GetComponent<Animator>();
    }

    private void LateUpdate()
    {
        if (transform.position.y < -2)
        {
            _animator.enabled = false;
        }
    }
}
