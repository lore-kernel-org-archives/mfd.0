Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733533;
	b=oCX9o/W6JwewOJdbbvxU0SlJWXsLroycAyDcYwjehiX3VoWomS0rtPyNtkYIg158prKE
	 tRHqeAGedADJz1dfOKa7AAmcQdjxPRMNmPVFOLYVOPsL1I+UVwsuepu3Beq948jAS60gG
	 SNijIUNV7Xr65h8tfbYZhk+NIAr7btRj8QiSKtHv6uM1hooPGv7HsXWMHy2Klk1RNU70b
	 GSc6trywWCN9ljFMEyUkKAQX3n3JShP8lwMSZUNt9d5vY9xOMKZNbE1R3+oNcoMQLsW+g
	 X3qIgT92V3PQCXnULRq2MCczl5Gb6stHSbQl0rh0zeSF692QoOcB+YacymUlaGGMBzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
	b=cqXj3QE/JSCoFh23AFsAMyDtZ2XrbDRDnbLB841ZLnljaKpgMf96oleoT2nU+SfyIOlg
	 I6K5V3NAJfMp14U3E1K6a6ZyzfStJmQWw5QhZT5vACtCB6YMmZE4nshI47/YG0srKucU9
	 tirD3bKjy+/7U9EethiVNmEjhuA/UNHGxZeDa08L4mFUoIQ8yQhVf38u+2lcrcRy3UFRy
	 Z22U3H9QZ4bUv3KNcn6zeCPQ2xFEcaxgZMqiiv9sYqRtsTzCSyAD1duKwDVGLgbmt2m4I
	 uREDhB/MI2hggonColxEDQbs2suaUub/Qcfc6Xqzh3DlX4hFDeq+Ppk3G9aEf2Ypo+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqKkvhY6;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFCE606A31D
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFCE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqKkvhY6
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso5653141a12.0
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733531; x=1795338331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
        b=XqKkvhY6v6PoF9sn5q1tK+LLXP+YMVQEDsn41Lw7sDxJwoKc1kUOaD9ledlVK+nsDk
         VS592mEoAp+RsY+Gb9gKMHjc7J4opCPAPEdj+eP9ykFfu8TCOM5oqDTZW0QhdeinpeJ3
         lL2DmZmndi0x1pKB+VrS/lzeEo9RcYr+2Ss13uRbxkiqlbWK3brQPWo8OYBaJMNQFfQP
         Ql7kiUA2a5IByozMQoiy+f+aOa2r1+qbgAdtqdkXyg0LkQVKr4j3UBSpMvBpJ0DJ5ClD
         DqSo6jkYDDa9AEpCe7O27f7e1lN14/fX40/hg9Ofrl0l/HvS6IFQ7QY9YulyrzdxpWXV
         VJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733531; x=1795338331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
        b=Sgdx7t9Ohy7CI6Y+nbG05/EMw7UE9GxyKivh3L56hckKLPbmwqxKQ9e11m2aadsMyC
         dtFUNFYTU2yFNbmto3HmIJFIRvue5+LO8U35qoHCVJlbrHBwtFkwsRs6ckxAlOZdanVr
         k3Wh+3hSa1a2CPstvENEs2T/1TI6tF0OKGVPOM69Bx0miSpkJ/boxXQNBbHo+3e0JiWY
         U71p3lIynq/ckjJAqAJTnGyBMAeXhlIhMR2e5spLqYRBO6lSgHB2rFSQwPRcpNVCko9Z
         DB5N74Q0hNATIBoanGFGvjz8TEJeMlYlkEUDEjbt8KmksFlSHrYtcVy8Y/V5IN+uOVfY
         sLTQ==
X-Forwarded-Encrypted: i=1; AL+hErHBUB5slfcG4nT64VcDg8NrzKdUvnNDdPK0DjzeDWHgND1ffOX5/haYoxQafvqSAh5ahGc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8WMNzlvIVbsK13l/olXSh2ziuMPEuPfMQntZvFVhcIprnby6dN
	3a1ldIyb5vZmnbhTZRphWDymgPxzcTYQCdjzhLqYw/zEQeFYIXEs7sZZ
X-Gm-Gg: AYBFou366Flp+MbN5/qxMjWbEZB+RnOAtP80fTjBrCveEGugxWlG/ne0M7jku5qGHnQ
	OSzLh8YOx185dCR57xVEnHJF57P5GdPhPcH3r9rPCvyMiKmKPdgtmilhZPuw5Udu3jaVhwGJoR0
	oOiqSI+LVXwLFYuvXY+zlNCzV42ETgxHPAI2bXcafFD9yuCB5U9/0yzowCuwts3Eq/13D0gWbW3
	i0Ga2hp4tUFn+LjtEc2VDuFkxWyFRKVK6iTWTvPXOGjal99M3+trsklMM+MXzTa5RCHNdV9Gv8o
	kQFFVgTJWu8zMtv2Ik8WH36TVWeBKda8/AFKMgj1Wy8yWuDSp/B6CgK+OoxeumChC9HmRB9UeTi
	F6r2F2heYwbpPP31aTUCvG0tSn1bxQmSRGx+nzcuGheiOmQvy6J0WwW41U5lPkiRb6LAwqZPwrD
	sDS9qXCgFBdWPFghveRv9LujQafNuqj4U+MPzN2BLBJTGc/EA4igA3RLdm3s8HXEUkbEvDUGA6E
	LAVRTzO739aXMufBgBfcWpB3T/gis2KxjLZ2o01yMTHjBXM479nta8BqpbQg91xNY4fL1+WJ9v5
	edX9lAYOONdvyRwacH6Eh8d6E4wW5E2yIGHg4rbUKftGgRnIkNsGxyfuUXRenIGlvbKHrvnbuSE
	Re+EGy5misw==
X-Received: by 2002:a17:906:9fce:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c5096342a7dmr672105166b.25.1794733531152;
        Sun, 15 Nov 2026 01:05:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 0/3] leds: Add driver for MAX8907 LED cell
Date: Sun, 15 Nov 2026 11:05:17 +0200
Message-ID: <20261115090520.102216-1-clamor95@gmail.com>
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

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Patch 1 of the series requires this patch:
("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS

Changes in v5:
- add and document a dedicated node for LED
- split adding led cell to mfd into separate commit
- expand Kconfig description
- populate devicename and default_label of init_data
- unfold platform_driver->driver

Changes in v6:
- converted to devm_kzalloc_obj
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Document LED support
  leds: Add driver for MAX8907 LED cell
  mfd: max8907: Add LED cell

 .../bindings/regulator/maxim,max8907.yaml     |  4 +
 drivers/leds/Kconfig                          | 10 ++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-max8907.c                   | 99 +++++++++++++++++++
 drivers/mfd/max8907.c                         |  1 +
 include/linux/mfd/max8907.h                   |  2 +-
 6 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

