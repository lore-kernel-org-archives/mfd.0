Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100774;
	b=Esdij7rIM133FnEA2pCtz1SjadrrUzK0muVNeghJ5wpWUv/thEUGP9i/N0aVzQrHHz3K
	 3feNBGhGPaii1WVv4mGw9SEZHAqXunMNXOcqmJGrkYsNnV75kucLMqX40UngdzTz1r6jZ
	 UaO4SuYxlCAVRvQc7jdiGfOCrEwRCpcegtD5KhkHK2Vf59Ygo6GUymPe9DH5AGZMdBv86
	 jDuEWwCfcGFoZSZEmasN5vPLAhsWSERSzaFDm+JNGCwiNQ4BOcVwbavXk27BQDKrRbfKk
	 y63PhIClTSp9T7oko6Su2Dc+px72joYMPI9zJlfVvlUHq4x8jInEYpvmXtF2alx8Wlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
	b=E5W0LXXI5L1owLH/GdZf5KISUeJickdlaBGtvjxGOYR90axz3NluhHHwAf39Y72dId57
	 WePXhhwTV5bUcI58LlVDOFmw8WulnlDeYhk2M9j6ZwlgYJrbg+nvOSLYCC3KQs2KCGASW
	 4HvKkuIsYpUl3BLyO4Ks5fWLhws2EhqH6t5+FKtJNlFnNlm6Y3gro+VQ4zuMCtUhi5Xof
	 zv+B3hUKiYN77jOzKsBKO3gNY37XKlikmAgVQCmYjI18N8T5wlhnHZgiFtsJsRd1Z/zEd
	 tKTpUtRmbmmPa8Hu8Uu85UWPxSDTBzSpBWwpgCGtZjHSrTpIT+XuHlJjZqlXQ+5bOXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cPsWeeEP;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EDA606A33D
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EDA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cPsWeeEP
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so558926866b.3
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100772; x=1793705572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
        b=cPsWeeEPLBNTqgXIriK4qOXPvOxxHJrVNA3PeFwEmnG8UoA9iBrQL5ykjiU+bsoFqI
         PvuhZGL/B6SFtdYfstgTfllFhny66JZBQjLuaEx5K/JXDdKQ+AusJrP8ngSF6gijjHGE
         PB0RbkbewLM/57dKe3no3zdqHlBVhGhJQBlipJaUO+qAOJ9EUh1vZmYHj6Iz1XNN8FKg
         iX4ojImWkDzP8MP6X1nGLv1syM7J28enzWO94L231g01o8d4f03l2dCqJ6aYhAZcVMlz
         BgxJt3ufInPe1aKzNayjk3cMYEl+JwFxeInZ29ADsDc2U9PbZVjghhg8fLr+gatBP0B2
         jWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100772; x=1793705572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
        b=bbL6V5ZhUJ89/9taNR8JXt99CSxgBlB7KPTA1B3RRq6KIwDAmu5124g/xuuZ2zoypd
         BVhK6bemsAyuKD+AykSN5WaoKy6hnmcGi0cqkPnl3Pm9OBosCuAezcmS2u09stYCtvFu
         wlGAMS3IC/Ak109MRAUF80AOCsi3TsFD3xaCE8xlujv/m4I4cMVWXaaB8rcSDHoAPkb+
         DsAtePuMJzrc58BH1NXgtghjNBJ4Hbd+vI60hamDrMbFKJ1bRlYSLORKryCwcte/83as
         8rPdV2SDtzGYU4/FYPaGSA6ECWX8OE9Y1ocAaJ/Vgfxt+NxvsoVs8rmqgnlFFydYX0pf
         xEcA==
X-Forwarded-Encrypted: i=1; AKwUvBy/QLXCEptSGCjAyLWrW0uCmXRdIuXTqAnEELwb9Qez3rPlw2aOHS+AI6OsFsTjM4WgOfc=@lists.linux.dev
X-Gm-Message-State: AFq9FYKuFjNjmgKDRl/BgaJviqG89kPKuH8UKrV8FOCXMqTnFfBsbkSZ
	xCj5qjhVxryKRPEv7epx+2Dj1+F7fKAhCcmXq2DpluhqfCVX/uIquooe
X-Gm-Gg: AYBFou0x2VU2FbOcPk1g/KnTLKMm7kAvvNXIU4z1m2sooDVCglvCb8Pyt6YQujVdX8H
	fnjNrs0YnyOpMK8JxFSMUwcsG8u9O6dtSzR4h6clCL2/Reyi8l+wDraWdGHDLE8nhHZgH8VHQDN
	zSAbYsuwLyEapJbLqZGmzrtXVTh5+G9pLz/bJyhBUfEfsTfacJF4piDPOsiYMNVKay7ilZZYSGL
	jY+WtwjpLHx4SS2czn82PVGCKS1jmVuefw36jjblb0xglIcS9S93p4a9wbAnMpGepNGtHre/+Xc
	E4PvRjY1xQtqUsJFW4mAgyJwfmWKbeLipHOFI3I+iHeSLOrwxDsGieWTpqSFrw2lEwBqwf86qj6
	913XFA+CV/LdQrNbRQdNpymMfc+7aG2LHA82F3HJgnB3U+edfpThxP+ofrdCWBp0R54pBDBY6xy
	3T0LaJRwocaQ5Kb5vGP6fGB3MbxM9a+okcC6L3aJgY6z5XNK9P/0sopYcjbby2wZrRlLHjOhA94
	4xpIOmsudP1g82x90x2z1r/frBajhd22LNcSaNjE5Dh51VurE/RNvI2b34yt7isiVV0TtC+LCl+
X-Received: by 2002:a17:907:9307:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c46bde93525mr1103423366b.39.1793100771899;
        Tue, 27 Oct 2026 04:32:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:51 -0700 (PDT)
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
Subject: [PATCH v5 0/4] mfd: aat2870: Convert to use OF bindings
Date: Tue, 27 Oct 2026 13:32:26 +0200
Message-ID: <20261027113230.47538-1-clamor95@gmail.com>
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

