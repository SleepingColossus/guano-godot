using UnityEngine;

public class MovingTarget : MonoBehaviour
{
    public Vector2 velocity;
    public float deathRotationVelocity;
    public bool flipOnDeath;

    private Rigidbody2D _body;
    private AudioSource _audioSource;
    private bool _alive = true;

    // 1 = up, -1 = down
    private int deathDirection = 1;
    private SpriteRenderer _spriteRenderer;

    private void Awake()
    {
        _body = GetComponent<Rigidbody2D>();
        _spriteRenderer = GetComponent<SpriteRenderer>();
        _audioSource = GetComponent<AudioSource>();
    }

    private void FixedUpdate()
    {
        if (_alive)
        {
            _body.velocity = velocity;
        }
        else
        {
            if (transform.position.y > -2.5)
            {
                deathDirection *= -1;
            }

            if (deathDirection == -1)
            {
                if (flipOnDeath)
                {
                    _spriteRenderer.flipY = true;
                }
            }

            _body.velocity = new Vector2(-1.5f, 3.0f * deathDirection);
        }

        if (transform.position.x < -10.0)
        {
            Destroy(gameObject);
        }
    }

    public void Die()
    {
        _alive = false;
        _body.angularVelocity = deathRotationVelocity;
        _audioSource.Play();
    }
}
