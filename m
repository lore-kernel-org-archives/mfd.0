Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB5548D885
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912933; cv=none; b=GJnQgp2++u7iWnRbbkZup5VUBxQySTBU2qDy/G4H7QWX8o7t/1l/pzC1Ht4+TgNO++GhPMhuiVbwIt34UYSfwks19+STh19IfpiO59f9wMVDz8w/8U9ReG6A+Zj+w1UT4cfPgD6ZG4rAwdzqThVBo9QqLvTXI3n7xnLzrDx1s7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912933; c=relaxed/simple;
	bh=yeWbkoIS6TzaXJxFeRrC28JWQXFRjVppj/nrT0wPWBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KIPapICNHTP8aLpGMHXeuUlyllxbL95W0Atbo/uIhD5aF7bPk/uOgn1Mt+eI5d6kidpSwAFgUusP9hc3db6fUqNX5JfpvMgWyDsJsGo8S9EH0Xm4/VIoGfIhFgIaAdBKODWyizyUakDeGpRgsnY3VB5/l67tW6+Koq+AJbybps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jR1EZHUO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jR1EZHUO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso23227435e9.1
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912928; x=1792517728; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S5oWKl9lJl3zE64Lxd43NHv+pVgZpr/FmTp9jsXZP4=;
        b=jR1EZHUOwOInbP8lJdyi+5iNrEn5oEqOG5BGZkqzlSxQkObMdkqOuqToSHCQFqluiX
         rX4fQSQYE7Gcay48KtgWPqB0jJCKqe1jqYZQgIWjuftHT2Fx4tAeBb4pkxTWRKHGAZOb
         pfQiejkkJCXxB+3rFpUunP1HOifGGMUvSublKkLV8tX3pidlMwetnnVXahbCBb5JKyWS
         iOCMGPPdBUNPVWKm97hXVoCLvW1BEHe3uIBbMTPEalgveKXjErWIdu0ioBUXfXIl6QvO
         k3fIrXG4LRoJWw6QPbrN+EvOw79a5Rf7B2ENeFrY3LEd4PMTIi06YEkhrR3yAYyQG1hO
         XSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912928; x=1792517728;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S5oWKl9lJl3zE64Lxd43NHv+pVgZpr/FmTp9jsXZP4=;
        b=ETuZmVCT/yRmiGwB2qSllDjV6fWwXeQAJLNhS6ZlEOrbjnidUxrLmTdaf0ovFTbhJb
         KXAvX1iXqQj0B5v572YqsfgOdKIqdhC5CSa3S6L3pEHet8AIMl/jogPlqi+6LM+wpfOh
         dIQhQG3J6CH5+jovvyfvGJFFbmo0Dm4iMyX4k+z0N6i+Kq0BYIo6jZbdGVhpwT5yo6Aj
         9vV6LZlvr/gh62iBHzkk5o5xT7quBoFq1etFYu5Q9aJuwI73kVncpzT+wcLXmHioxHP0
         V++IazNwMcGsRBg8oGwOWDD+FG4qswCNpVPnE5b2gD92PE1jwpTb7jlHdyMF5I2ie0We
         xN3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZ9NeQEuEFNAmHCkoj0FTWsk44+jEEE+VpMpwIfrVl9mudlibvuPyKuggYouETXFtW/R8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ1PLPDZ7UCWOVE3m+f7/8HtZ1XPMNciccj0Xd5K+wOH43X7FwH
	udV4P8oYWVpBLv7H8lpSsErr7QwioRmEtVB0af5kVdWr9C9zMqLHiH4e
X-Gm-Gg: AYBFou1xtgszq2krSPMF9+Mku6NKryOhuhdw8M2wTlkt/oZYDs4Nu8F2NrcZRyhTTmd
	m6sxlEhrIbes7HSbk9TTTkrASHkJApqps+Ej1MfI3xSl9cpPA8nLcmt+Sejw3OlLnxuncWWn5Mg
	I1SxoPYDB1fdSiW7kktv/Pvoy/ObkdpPi/cSeDzYPfE1F8guKjAeAvz3FVUw32ilsdzs9fNfed9
	Y2tV3lc22a8A/4Fz2LYdFmFup8gdl51bTf/HTdGkPdEpS+LqXH8HBDPWJVcTxl8QkssTwV5nbIG
	8G82E+UQ7bt1DfbSOhLq7C3x3L0eX13mU/BkIvsSSmjalNpyVzIgdo+xFHDUfXTKWtr0POEuAsb
	VtNoE0eZPHOe5bC/947tdJLWGiVXtCYpH1Z0S1e8onhkeWf6P9QsekyEOWaGJfy6KsthyC4X9qG
	Ewd3LH8Wk8RHVG21pbXjTkiOlt6XjG7/wLCmhuWuDNsGSI7cVpYJFV+tnm1KC4JERFcZEYvfc7P
	nF5/j5hs3mAlNFswr50rfelSOAy4g==
X-Received: by 2002:a05:600c:190b:b0:4a1:82cc:1e9a with SMTP id 5b1f17b1804b1-4a18e4b2b25mr264581455e9.17.1791912927910;
        Tue, 13 Oct 2026 10:35:27 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca51465sm284127195e9.4.2026.10.13.10.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v11 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Tue, 13 Oct 2026 20:34:56 +0300
Message-ID: <20261013173504.451391-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for embedded controller used in Asus Transformers for
managing power and input functions.

---
Changes in v2:
- converted sysfs debug exports into debugfs
- added kernel-doc comments for exposed functions
- fixed minor typos and inconsistencies

Changes in v3:
- dropped DockRAM commits (both schema and driver)
- integrated DockRAM functionality directly into the controller driver
- EC schema moved to embedded controllers folder
- removed all cell descriptions from the schema
- removed all compatibles from the cell drivers
- adjusted naming conventions to better align with the ASUS Transformers
- defined EC variant sets to provide coverage for all known devices

Changes in v4:
- grouped known programming models of EC chronologically (both schema
  and driver)
- call debugfs init only if CONFIG_DEBUG_FS is enabled

Changes in v5:
- added asus,tf600t-ec-dock compatible to schema
- rebased on top of v7.0
- kzalloc > kzalloc_obj in keys and kbc

Changes in v6:
- removed asus_ec_handle_smi casting
- asus_dockram_access_ctl > asus_ec_get_ctl in control_reg_*
- fixed battery Kconfig description

Changes in v7:
- added status check of devm_kasprintf where missing
- devm_asus_ec_register_notifier dropped, added .remove where it was used
- removed cell_to_ec, asus_dockram_read, asus_dockram_write, asus_ec_* public API
  asus_ec_i2c_command, devm_asus_ec_register_notifier, asus_ec_read, asus_ec_write
- renamed asusec_info > asusec_core
- ec-kbc: added packed size check
	  ret > error
	  improved key remap logic
- ec-keys: improve formatting and comments 
	   ret > error
	   switched to dev_err_probe
- ec-leds: reworked to register both leds via loop
- ec-mfd: adjusted Kconfig description
	  fixed smbus operation sizes
	  fixed saving of EC fw model
	  adjusted IRQ flags
	  converted to use definer for set cell composition
	  added factory mode states enum and handling
	  defined some "magic" values
	  self > client, info > ec, ecreq > ecreq_gpio, priv > ddata
	  asus_ec_chip_data data > asus_ec_chip_info info
	  ec_data > ec_buf, ctl_data > ctl_buf
	  added and improved comments, added structure descriptions
	  asus_ec_magic_debug > asus_ec_susb_on_status
	  removed all dev_dbg and most of dev_info
	  pronts with model, fw behavior, factory and susb state preserved
	  switched to MFD_CELL_* macros
	  removed debugfs
- ec-battery: swithced to BIT macro
	      lock usage moved to asus_ec_battery_get_value
	      in asus_ec_battery_poll_work fixed possible rescheduling fail
	      in asus_ec_battery_poll_work fixed missing not charging
- ec-charger: POWER_SUPPLY_PROP_MODEL_NAME set as the first check

Changes in v8:
- added MODULE_ALIAS
- renamed DOCKRAM_* to ASUSEC_*
- ec-keys: input_handler moved into private structure
- ec-leds: added brightness_get
- ec-mdf:  fixed i2c_smbus_* return checks ()
	   improved model storing
- ec-batt: added status check of devm_kasprintf

Changes in v9:
- fixed i2c_smbus_read_i2c_block_data return check
- blocking_notifier_chain_register moved before serio registration
- adjusted get_unaligned_le16 bounds check
- unsigned long long > u64
- iterator vars made scoped
- removed "magic" values from ec-mfd
- simplified logging, detect split into detect and init
- improved error logs formatting
- adjusted handler in media keys to connect strictly to dock keyboard

Changes in v10:
- ec-kbc: fixed possible out of buffer reads
- ec-kbc: set notifier_call before blocking_notifier_chain_register
- ec-keys: dropped input_unregister_device which should be handled by devm_input_allocate_device

Changes in v11:
- applied changes from Florian Krischer (read_size parameterized and fix keyboard response framing)
- ec-kbc: switch notifier and serio register calls
- ec-keys: used WRITE_ONCE()/READ_ONCE() for priv->special_key_pressed
---

Michał Mirosław (6):
  mfd: Add driver for ASUS Transformer embedded controller
  input: serio: Add driver for ASUS Transformer dock keyboard and
    touchpad
  input: keyboard: Add driver for ASUS Transformer dock multimedia keys
  leds: Add driver for ASUS Transformer LEDs
  power: supply: Add driver for ASUS Transformer battery
  power: supply: Add charger driver for Asus Transformers

Svyatoslav Ryhel (1):
  dt-bindings: embedded-controller: document ASUS Transformer EC

 .../asus,tf201-ec-pad.yaml                    | 119 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 169 ++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-transformer-ec.c       | 125 ++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-transformer-ec.c             | 562 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 289 +++++++++
 .../supply/asus-transformer-ec-charger.c      | 208 +++++++
 include/linux/mfd/asus-transformer-ec.h       |  94 +++
 18 files changed, 1956 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
 create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
 create mode 100644 drivers/leds/leds-asus-transformer-ec.c
 create mode 100644 drivers/mfd/asus-transformer-ec.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
 create mode 100644 include/linux/mfd/asus-transformer-ec.h

-- 
2.53.0

