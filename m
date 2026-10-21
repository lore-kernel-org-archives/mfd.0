Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792564321;
	b=KeZGmennq6QwEid//9kzpMwjVgB1UYVMjear5S7X2KGW/m4DTR8u0yjOp5Q/L5zgsPqV
	 EIbyEcvvs+kkf+DbdrcK0eeedX1CYelQkfvf6SQ9JIr5fqHaxXsMgjUqA+05cIvFNi8zp
	 1x+mra77oJL9DzYWTveDQgSOzBU8hZS6+35NIz1E+mp32cfE82eORYnSNjdfqjm1iOyu8
	 MWlOHiCvUM+E/FVhww9xktljNMm38p+QMTF6mn1UDltwd03C06/yeJZJFNLyQfGSs9poi
	 RN7W8dZ3NQYOsqjOkzeC54VRZu8ydBB+X4YzgS3nnM4X7RxCBFNdzCDgpPdQgw5lI0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
	b=4eC+tH+Au9U9R+WQmv/Wm0eeDGiUn47F3Ya2cEfJT4m5JS6nBtsNuBEhEbE/1w2YSatq
	 SMTegFpwoK0clDLyhLe9gtFRmL66Gnp+NljYGQS3Cnj4a5q+5xym+7wBW7raU6ISEKbdR
	 X95G7u60a6tQ1oxcqyB1FAD2eu8p5JVXW111Iq25c8ye8giR6tki0lU+cBmsdhrzhJWCD
	 FEhc6WGTOtkMc597KtT98cYCrCeA6+h9Qu8mnnSqkTeLr07INUsw1NecFO9YOmt/CWWNB
	 qiVjUSL0hsiwo5bYGo2FWzUKZ+JkMEBYKoyHq70luC6P9PDnU8D+5eCWqdBFqJN50ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LEHjHjbR;
	arc=fail smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCF4606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LEHjHjbR
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so475936eec.1
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564320; cv=none;
        d=google.com; s=arc-20260327;
        b=B8XByN7s73jSS53qQ79lT5wwPrktv0f6vtc8DH7tKGjY7f1A46Q3vIunEXd298SebW
         mkC+USkZv02McPRykqHS7XmBE8DdvypqIPy9hOoHzoxAHQmpsX21U9HkNh8/UxIbKmdi
         pGZrCJGP7gvcugsJWmKMc6KbrlGdgL9a5WS1hwx4z8mAfG1vBSWM883JTa1fHpd6dCTZ
         +rIGdkyIsgDxJKvrx5ulGsJ6znkHZjOO2jN+euPEL5bQQJ/yzFaK4QPXa0XNVDCO8roG
         YFJbgXj5l8V+gvCtNBuPiOid1wyvdE0oaHqe26VzoKDfqoQclDyoH4THhnQqG9cLaOl+
         ZexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        fh=OV9/OAmI7jYydgUQocoeqNdsvdGYGkyS3lY8NE3QXkA=;
        b=Aan3uMI9hGJCVielieD4q3kREYje6Px5X5JHKBYOL7HENLn/jXFMbHw/meo/BpBY2Z
         xDFXrXLhfK16eMDFic8MRPj/Wwid1DNKZuvCWBduyXPGIagxDBaiiJau5DF0r7n61A4d
         ZntGoZNLgRpINJJu/tK5BhnNqDxTW5JF5Az1cc+KVuCssgZ+DsVartj3SywdBgDu20pC
         cQrHum2dgS07tQFbFrZloKzM6SQATVKwWkwXHNMasZ5ocjEG40JjyDTCZSIdDw2ffqge
         jdajLYKSIihqwAhSbqicnotQQ/o3WbJGX2oyIZ1Hdc3Msr6UeJPjbuGJRaJEd7IXc5ct
         m18A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564320; x=1793169120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        b=LEHjHjbRqoLiyni7ib8OWkHVjXfjZUKv94eaPv+zlz8lOVJR2V7xklOA1SsSfK985A
         ia4HrnZz4BvuO/dt2Bz+g3t9T8I1K3Rhra/i0HYe4ED/j2CE+YwqYsFAIrvIS8fjcVtt
         lIV7VNrVJtI8HrgKKMZ7Ill2wDAcrYhr3lrk4Vgn3zkUwwKpASn5Sw3fvybU/pGGHx6J
         gY4lcBVnvO3shGpfNmpUkc3Uz1eZmeZD5+t/8/4kgbvQp2kWJlh8g4WBdUPDpd58lJO3
         SGu90U6iOcjxHo6THsCgCaQu6UfrtP98q4wXiObEAOE615QBJEplqg3NDSVI2kLXLv+3
         l3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564320; x=1793169120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        b=tWMzQxCfFYpw4Y7lxO13yF4YOf8sPnXbB68vreFgUwxUZO/nSPUqI8QSwTGhp5AaLO
         uOpa55llCdVDTYYczh/rfotIFX52QDogMg6GtBeEKEDj4eDv0hsIqQ7WqGgGYoMJpqBc
         3oUR8/zhjpO55x9snpIaIfPKFwMVwevfcsBmPR6dCoLiP4XTsQaRLJpoQVWJOai9K3PU
         xHWwR/cKzSS4aLCN/yIubPX+7Pqm6n61LlKCjum/zrJdxJYNig4MNGhg07yntR9AJMTn
         +dcNCoe9nzfDUd6TKryD8ubu6ZGn+kJW0/bbrot10oDQfLQISqft1X6qG33r3lGrPPY4
         9hEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiah8ZOj7Fet/OhxJhiujw8AisND0eWsHtau04W1CsMQ8s+Oa1bx7CS1lghIC1IkcmQho=@lists.linux.dev
X-Gm-Message-State: AFq9FYJPWn7trCcKn5xeLlogTFPuhfGtZcNI4dJB3LAQMxdRaJ24BAoN
	G3YXC/lP1FLvqvHCxlvblBCZx8JYKLheA9/F6sPg39G6CH7W1spifGc0rzFHJ6SXt83UWB7c2mY
	YOLYuAQBviaRR8cbjfLhnNsp9UVbvM2k=
X-Gm-Gg: AYBFou1tOb4yXMH/cn/qEf5AbmeWSe2qSXgnAx1HUc/lEUYA1M61Z7zdmXHM+Lggihs
	HseDYv96FmYUXjnyPmsWJ8JXob5HATP9QiTQ7qDSJ1Xh0njUQjqOTRLpdb71/Rwdwuy7A3Vkva9
	IcXeXSK1AjzRL7bBN+Zub7X5WYwN3892/TDmde9qbH1V1dXi+5wcVMXWPoe1gG8Q67mQkR2iPHa
	HVPL9w7kICCISWluk/zGcXq0H+aekNAQJRgtSsV5fUCyUc3GpcBknnbduGzgvdWKQZtUNnB3zYJ
	Cjig4b4gi8+gQh3nne/wgNzIfEsKC0B+HFZcwWLAdk6U2+UQ2bU6zt9smoK39NRVGNgFwG3i4dF
	0EGLEArHiAT1SjXxrE2KJjMItYT25HrEIXngjQ5P51TBFgHlD4dr98xCSlAdQaps7936DGw==
X-Received: by 2002:a05:7300:fb83:b0:359:8492:2107 with SMTP id
 5a478bee46e88-3674c43c286mr3040666eec.10.1792564320159; Tue, 20 Oct 2026
 23:32:00 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com>
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Oct 2026 09:31:46 +0300
X-Gm-Features: AclHuK_QwW61N_9Foimi4NgaLY1jJdwADyBjJeIb9hmtc4k1Kv7HNMpLzSeTeY4
Message-ID: <CAPVz0n1z1s9aCLk1OzhuOq6V0p2SYM+cJFEBcSopHzB-fvcr=g@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add support for embedded controller used in Asus Transformers for
> managing power and input functions.
>
> ---
> Changes in v2:
> - converted sysfs debug exports into debugfs
> - added kernel-doc comments for exposed functions
> - fixed minor typos and inconsistencies
>
> Changes in v3:
> - dropped DockRAM commits (both schema and driver)
> - integrated DockRAM functionality directly into the controller driver
> - EC schema moved to embedded controllers folder
> - removed all cell descriptions from the schema
> - removed all compatibles from the cell drivers
> - adjusted naming conventions to better align with the ASUS Transformers
> - defined EC variant sets to provide coverage for all known devices
>
> Changes in v4:
> - grouped known programming models of EC chronologically (both schema
>   and driver)
> - call debugfs init only if CONFIG_DEBUG_FS is enabled
>
> Changes in v5:
> - added asus,tf600t-ec-dock compatible to schema
> - rebased on top of v7.0
> - kzalloc > kzalloc_obj in keys and kbc
>
> Changes in v6:
> - removed asus_ec_handle_smi casting
> - asus_dockram_access_ctl > asus_ec_get_ctl in control_reg_*
> - fixed battery Kconfig description
>
> Changes in v7:
> - added status check of devm_kasprintf where missing
> - devm_asus_ec_register_notifier dropped, added .remove where it was used
> - removed cell_to_ec, asus_dockram_read, asus_dockram_write, asus_ec_* pu=
blic API
>   asus_ec_i2c_command, devm_asus_ec_register_notifier, asus_ec_read, asus=
_ec_write
> - renamed asusec_info > asusec_core
> - ec-kbc: added packed size check
>           ret > error
>           improved key remap logic
> - ec-keys: improve formatting and comments
>            ret > error
>            switched to dev_err_probe
> - ec-leds: reworked to register both leds via loop
> - ec-mfd: adjusted Kconfig description
>           fixed smbus operation sizes
>           fixed saving of EC fw model
>           adjusted IRQ flags
>           converted to use definer for set cell composition
>           added factory mode states enum and handling
>           defined some "magic" values
>           self > client, info > ec, ecreq > ecreq_gpio, priv > ddata
>           asus_ec_chip_data data > asus_ec_chip_info info
>           ec_data > ec_buf, ctl_data > ctl_buf
>           added and improved comments, added structure descriptions
>           asus_ec_magic_debug > asus_ec_susb_on_status
>           removed all dev_dbg and most of dev_info
>           pronts with model, fw behavior, factory and susb state preserve=
d
>           switched to MFD_CELL_* macros
>           removed debugfs
> - ec-battery: swithced to BIT macro
>               lock usage moved to asus_ec_battery_get_value
>               in asus_ec_battery_poll_work fixed possible rescheduling fa=
il
>               in asus_ec_battery_poll_work fixed missing not charging
> - ec-charger: POWER_SUPPLY_PROP_MODEL_NAME set as the first check
>
> Changes in v8:
> - added MODULE_ALIAS
> - renamed DOCKRAM_* to ASUSEC_*
> - ec-keys: input_handler moved into private structure
> - ec-leds: added brightness_get
> - ec-mdf:  fixed i2c_smbus_* return checks ()
>            improved model storing
> - ec-batt: added status check of devm_kasprintf
>
> Changes in v9:
> - fixed i2c_smbus_read_i2c_block_data return check
> - blocking_notifier_chain_register moved before serio registration
> - adjusted get_unaligned_le16 bounds check
> - unsigned long long > u64
> - iterator vars made scoped
> - removed "magic" values from ec-mfd
> - simplified logging, detect split into detect and init
> - improved error logs formatting
> - adjusted handler in media keys to connect strictly to dock keyboard
>
> Changes in v10:
> - ec-kbc: fixed possible out of buffer reads
> - ec-kbc: set notifier_call before blocking_notifier_chain_register
> - ec-keys: dropped input_unregister_device which should be handled by dev=
m_input_allocate_device
>
> Changes in v11:
> - applied changes from Florian Krischer (read_size parameterized and fix =
keyboard response framing)
> - ec-kbc: switch notifier and serio register calls
> - ec-keys: used WRITE_ONCE()/READ_ONCE() for priv->special_key_pressed
>
> Changes in v12:
> - removed unused includes
> - fixed kernel-doc warns
> - added check if dockram client and data are not NULL
> - replaced handler in media keys with Dmitry's implementation
> - calculate battery time props with unsigned value
> ---
>
> Micha=C5=82 Miros=C5=82aw (6):
>   mfd: Add driver for ASUS Transformer embedded controller
>   input: serio: Add driver for ASUS Transformer dock keyboard and
>     touchpad
>   input: keyboard: Add driver for ASUS Transformer dock multimedia keys
>   leds: Add driver for ASUS Transformer LEDs
>   power: supply: Add driver for ASUS Transformer battery
>   power: supply: Add charger driver for Asus Transformers
>
> Svyatoslav Ryhel (1):
>   dt-bindings: embedded-controller: document ASUS Transformer EC
>
>  .../asus,tf201-ec-pad.yaml                    | 119 ++++
>  drivers/input/keyboard/Kconfig                |  10 +
>  drivers/input/keyboard/Makefile               |   1 +
>  .../input/keyboard/asus-transformer-ec-keys.c | 212 +++++++
>  drivers/input/serio/Kconfig                   |  15 +
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 264 ++++++++
>  drivers/leds/Kconfig                          |  11 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-asus-transformer-ec.c       | 125 ++++
>  drivers/mfd/Kconfig                           |  16 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/asus-transformer-ec.c             | 569 ++++++++++++++++++
>  drivers/power/supply/Kconfig                  |  22 +
>  drivers/power/supply/Makefile                 |   2 +
>  .../supply/asus-transformer-ec-battery.c      | 289 +++++++++
>  .../supply/asus-transformer-ec-charger.c      | 208 +++++++
>  include/linux/mfd/asus-transformer-ec.h       | 100 +++
>  18 files changed, 1966 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/embedded-controller=
/asus,tf201-ec-pad.yaml
>  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
>  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
>  create mode 100644 drivers/mfd/asus-transformer-ec.c
>  create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
>  create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
>  create mode 100644 include/linux/mfd/asus-transformer-ec.h
>
> --
> 2.53.0
>

Hello Lee!

May you please pick this series? Dmitry Acked input commits. Regarding
adjustments to input patches, Dmitry is fine if I send them as
followup. Thank you!
