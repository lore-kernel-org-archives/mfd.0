Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101611;
	b=Gu9zAU943YIs/tWLgkO5lmUWxGjKjA7MCLg+PHbchIpYr35Sbsxy9a/i6NNCPvOfUHvy
	 EEjX8n7BuL1DkB+doC5kHmnmVlQX1bMB6BZX5RhpyNMNkRkTMLUmQtfCgVLqrFo2gwbdm
	 jeikLR4MuU6c+v7jpyRoqS/RIwd1SInQZMvx4dymsERK7p7lldRD3BFc4D4iKI7Wp0pGC
	 yhcps/gVOzeVpXKzdJA9FiLiRrvGhkBpHhGl39KdfCsHR2gLD13fJPOtUp4698jcQZGGW
	 KYXhdGawKuppX52yRb7yGA8VzJ+V9X2Uh+3itYHUWZ6FEbjcVbGVSTwlSylVfcJA1Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
	b=nCAbMD2cmaiCepV3FIFhmvz3trVNCTqWoE3kcz/TYcQZ45gcMCUyA0dinx0GBJEuJ4Nz
	 xZ8G96pj55hc8B4+eDS0FooeJ+rOS1gbMVJW8DhlnfvxrwnIrTX+U4LJnRnZdhHSmDptV
	 YUxwjEOaZKRAMrATTrBlXb3Bgr7BI9qHqjvGZLv1+aGtAUfEMmGCsaA5XZrVAitW9Mr36
	 YXlm6wfFEeZ6+bscSvDfaAt4+X5OuTKpoQu5RPDSJV7WAAmsBQs1z8jsGfmASYpNUOx6D
	 nJeEdSQBFGztVBHsH0JiFqLjzXUyGj+gsE7FHcw/3Ah4LqwtxCl1kA0+o1KPhuex9iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDCYpYkj;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4D0606A7F5
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4D0606A7F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDCYpYkj
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so560756366b.3
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101609; x=1793706409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
        b=jDCYpYkjjqzfH3l0kHx/GVJg/QXvRRZFWVXMGVo5luPKSpAKMLOKT/JewFWX3Ktg8o
         enubWqnIxzzpygbZAyHTrArHa975yCGTAltgpLa2x3iMY7mjMZ1D9PiQ0I2N2bLu70ak
         tcl7eHIpK5jAfwzNJ1UnPo7Bk0CbP8GCraAv8ZbPm8UdlMlNnKY55BSvf23nGUlzI7x+
         gobT8KUyVAoz9HKmSZd/VnFcDeAlw9TINGd4U6aEjAn4J5SKi+asWaekLgo6HVZPgcHh
         DE1fhdqk6IFG0v5ZgTnyuNNr4lxOF64kj2KgpqQUCldtZNVakLgE2CWG+tQBBw4+Ggxo
         JGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101609; x=1793706409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
        b=mh2PhzDYni9iiHdz4h4uVujvdpUGg6zO4FaQU9D3jnDvW7OVhvgISqv0cbRQoWZoVL
         fgRYN208W8sICaerD5BK9hmEuWaijkpTNQwmi7RrU8aHCVDGoOjIXenlLn0pxlrz4/g9
         eLRgH8nKs/ljEs+sPmCPpLqhj1q7DLml2cLFyAZXDxrUxhykwVMmhWQn4XU+qKfoMmes
         SwYecSB7QxhUlRqOAc6CAHZo6M5LwHWcmw2njlehbDWj+wzraBb/2PwRhAw/42L22WqV
         r/5OWA1qSyjO7lAiCcWi7MFBuhvldtsn4YeV4bDG1c4CSrOEMku6u+6HNKHRb2eC9ukx
         pc0A==
X-Forwarded-Encrypted: i=1; AKwUvBwxdJd497iRTXnWI55rJa6Ov9Noqhug9i4M8G++UP2yaJbr8HHycOuyvhAzHZnnzNaHkag=@lists.linux.dev
X-Gm-Message-State: AFq9FYJD6wQvwnuPjFjoVDomWaUuB4FtDIr3doEu4H6Q6d31guyG1/dU
	yxh1+CRW0drlr2JHGb1piHZLPL89CpHrdYM1Ia1GJkYwQ6U4klydb8AL
X-Gm-Gg: AYBFou3eTX1ZY+fce7SXTYYn6t/s3qjOgS+81PTfrxx+UFRwFrFfKM487enQxcfZHJp
	CEjEdK+H28kynK0QuISCBIpc5zpYzaEpatsK7KLUgKhjFNQBgp3UZPyU26tQ1/y1GRMJrHSsx2z
	R5EsuWoctTdjo5EiV8cy5HWT7tt/3WU/ffGf1vKKUwl+BYuZUGgu3qzTRG4jXmbozlBaoIZ1ave
	0TDJAqZWJUmzvyOmI1givFbcsFz1kZpjn6CHzI5Eb2Y3gBhf/4goj+l0z7TPLnxyPUNnduGk5QI
	mhzD6Hende4vjkI955g+u8YNAroZdhK1+2TLndWTw3jeyzbzM91T6jK4i/EJUivQreyBFcGuJ5K
	vvFrWvJH06cCz3S9aDsRINPsNXhUrV9tMvZnRd+YlT2IzhYmss7msVkuxyq3yWK1UH5hgXrP6Qd
	RGPjIC+Sqlf91ZHZS4dtc0+Yxb6H+eCEM6itjJ2xn6mlx3X0VYjgAsRoPpsUkzhUIJJVuGVxYBt
	Qb28V5kqGIcZSs6hyhWZzerpVIsS2muiUn7yhULwANfnJJ5sLzuPAN/XoROxPbRnLHcmSTJkm5B
	+Vs4T1Bo
X-Received: by 2002:a17:907:3f90:b0:c2e:640f:f9f0 with SMTP id a640c23a62f3a-c46bdacc9a6mr1123370766b.5.1793101608817;
        Tue, 27 Oct 2026 04:46:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4 0/4] mfd: max8907: Schema, pdata and poweroff
Date: Tue, 27 Oct 2026 13:46:30 +0200
Message-ID: <20261027114634.79706-1-clamor95@gmail.com>
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

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return

Changes in v3:
- added idata check in max8907_regulator_probe() for BBAT/SDBY/VRTC
- added conversion to devm_ helpers commit
- switch to devm_register_power_off_handler() and
  of_device_is_system_power_controller()

Changes in v4:
- dropped in-supply type definitions in schema
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 159 ++++------
 drivers/regulator/max8907-regulator.c         |  11 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 347 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

