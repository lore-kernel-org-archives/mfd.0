Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795846;
	b=2FAmZxdzVzrqhc7jEK7Y3CAWxPTgsrAF6ijUTHNRQqu/l3ZlZ7pNyK+D2Vme93xcYysz
	 Z/9+I9krSldmUkb5XdnZv5LxSU0f0uMetgXkDjoo9pHZwslUN278BH1CmrXLt5oTWmrV0
	 jcKRrRN7ZRI0uNASrjx7ci/UrpmvSLd87cyT2dGfuPa0qWdQE3saEYsCPGVYlLVAsxLXv
	 qS+MmfDag/H+zTMqzlcXxQkEBLE8GXNpKPWnTFFvbtaXiE0c43CUbXNvXkKEDSiOhQGAw
	 J+yQggGYFo71V3dd7ZL+NyQC8Rp6U8v7ExdAJjcxBJgLeVQZG3YcV4nFCBLs5eevzbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
	b=f2p6qua+U4lhwznrqcsz4PIOLEIZqJaLm6Hpi6rvVdbegH71EfxFsbMF7ner20ICTLwb
	 OXA5fTqliU9okLVVFdDL2B67xkmI1LYzJc6PjLmSlQ2SGhxaPJDxxtv+rgX5BSx2WKfXp
	 gFV2BCvEk43i6KGPClJQGY43CgknKXkgJzh0jKZ5UPZ3mAn/eYQYfTnupOaKJ6u/TEUmx
	 skcb5h7+zgsRr+02d42GruRL9knBiy0NZ2vDPLc1acpS0dTWAVD0vxxuW5Hnmg3gggFkx
	 fYUixHSTN1iGbEIsbpfgP2FRN003GOiQBCmszpGxCBGE7l0k6N5BSs7+retDNtz25UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmlWvtz0;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D93606A329
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D93606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmlWvtz0
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d885929so529690f8f.3
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795844; x=1794400644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
        b=ZmlWvtz0x/fvw29f5IkQZqySACMq3hHfpPXL4HBJek/ECHvFiU3zth6z18wS9aLaf4
         Lf4WGOBwoEB7xVd1ndkOycUiqjrLu8k9Lb8ZNgeC2CBHC1+NtGXsUHCpFmr1QYiET/bQ
         19PTtnIm20qU0tYlXJQIRYguvU3Yd0e9bbNSyeH5hH5eiS4vA1sxBsO3Khq1pIXpiepy
         +C/08YDZGIXCnWF7WZo9fv9xEnMp0X07X5YWrKdc9tgnbxL7jwekITTEyEvATTh81pM6
         sSxle9hHkJqxRnN4ExSYsEmNOLUbv4S/Y+XVqCYYKSGT/zIfkMVjh89C33OxNeMq0Z0t
         0hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795844; x=1794400644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74V3jje9GT/TZJsW05wIZrY30Lopn0gs+JfNYxexip8=;
        b=kX0qojuF6RGdx38j+b95wUA3l4o3Rpemn05CkB6Y828/0OuQHtPeVgkh+2psAJ7dG6
         YrcfCQIlIWWhAEnxIiFVHW13Ldy6QT6Q/djvtmAbgk2ta29hTIaT8UAdZMnF8jxzSyzn
         fPbB2MKHkpzcEqIXSqIjSia+Eu/0H0O3jHgRxGlVeQtuum3H/taiWaxhuWR1ACoSUK2j
         /AntMJN9ZfXqMXD7pO3HjUDmISfTKD8LWKTimRQcIo5bufDyaypkMuqkdXl79Xq5kD+g
         RP6i/s1cRyPBG6fFNz7xXTo7f00YBtp8lGDx83U4VI2ftv/WkZmCd/XLgkdzykxWjQHG
         8w9w==
X-Forwarded-Encrypted: i=1; AKwUvBw4rCq9lMRETgR4IKdl+AFxiA8+oIco3k5sXvMuBykNEHcIk7QAAKho50O6IJhKTIrlkec=@lists.linux.dev
X-Gm-Message-State: APuU4Z9mu2CIbylDwLSy4krDBcvtLItqW028ucb3yaWTc5JiU/g6UyWF
	T9cLeebuIIv+bNYNi/hh4G4fAsc62PSUiVHZmsVXdiwzHjp1poD6SodK
X-Gm-Gg: AYBFou1cV9sitHam4U+B1dRKwzpAKu+VZGouuseZ6Pmn2sz6iJKQMMs+VBWsrnC+P0d
	qfCsjwaSQW2zPR7gfurw/y60balJRcEks7P4sL5O3oi+XfuTAVm6VJwKZla8jxcjK4oc5U2b4Ba
	5pGai8xUNblV65I73630bfxW9NzNHmSAb4jFcbbqwoG+noR+pFhd6EYCrtpPonvnxW128VhLSUL
	xai7QeyZ7knFq0uFj6fVj0kZgj38ivP3LgAqPd6p4xUEecIhVoL1V7uzTQjIc+2mGTJj1/jUqZx
	qq6PrHm6QehNQlNnJeo4sAMFnCqNDq+z4lmeWbSVHBWFTZIVSkl08YC1v+ZB+WjGnbkhGAz3uGY
	hT16ENn2SFiIiUFUP5JvZpbHm3r75ifD3aSAs6AAVa9e4PiMSAIlatjYiLL6T17F83VYWXrKymr
	ymGxMZEQ8aLs1cCvwbevKx/XXsKIjYWlREz4lxkYmEmVGzqqYSgAvCFqCg8oPstyFOpmH6fEtw2
	6QidHMZjejuhzdqlGc4jnkJ6N25rPapiMZjwC+UEl0nACgLpoDBNnMreJeecf6cvwSAIsbzS6Oi
	NeKChvsPdt7Uc0UCmMR5gGLgdN1BjRUbliQzaihnT14guXADAA==
X-Received: by 2002:a05:6000:2c09:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-48e6e50089emr35262303f8f.35.1793795843957;
        Wed, 04 Nov 2026 04:37:23 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/4] mfd: aat2870: Convert to use OF bindings
Date: Wed,  4 Nov 2026 14:37:10 +0200
Message-ID: <20261104123714.234634-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32

Changes in v5:
- drop max_current from aat2870_bl_driver_data entirely
- remove legacy gpio and mfd core headers
- headers in aat2870 sorted alphabetically

Changes in v6:
- led current set to default matching driver behavior
- max_current initialized with same default value as pre conversion
---

Svyatoslav Ryhel (4):
  dt-bindings: leds: Document Skyworks AAT2870
  backlight: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 133 ++++-----------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  78 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 264 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

