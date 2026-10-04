Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524234A3A5
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132364; cv=none; b=Btsm19P9dtzMkToWNmrrqKnwuampF8b85F3zZ7V9qL7VeRlQdzHpyCLW7yBsXYgngZFdlzKkwMHlV7aX9pcRWjaKAKonpKCJpoTXt14PTnZIfKLXTq2dEIn4qJLm/BOFUuemHi3kdFhY7UXOImnLRQRTEd+bQkoIwBJBSmXJPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132364; c=relaxed/simple;
	bh=l5oEal4VAJKhbsdVKhFkkLQTTN9gxEOa+mODKSDfhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=frR20OoN7mUK2cRfpfm4LI9/8T0DD3HPs9eojwk6//p5Wh5vRJX94JwWR5p/Nt4tCtJAy5zdw1cHkX4yum8ooS3M2i4Ksd05P5qiAjhcfKb79QqCqCUwDZAovsYS/TXQ6YYZSnOGdA1KnmXhZLFefd20udD1n18sQgIOzHnGlW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiS3E5Y8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiS3E5Y8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11853185e9.3
        for <mfd@lists.linux.dev>; Sun, 04 Oct 2026 09:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132361; x=1791737161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=HiS3E5Y8iwFqz3clKikNKp0VF+yxWO7k516OP8mDNwWnH5kVlUy7yzW9VFKI7mKskA
         qkCSBSnelB667HcIOsPqG5J9bMKo3mvB53+DJ+wuCi/oep5Cep46var8sV+YKdPOYoof
         bB/HPBDsbU77dRrPJK9LYxktgXf+cL3AL36PpxN/wibwOr9ytQzEXr4SF4SpjLEt1RQc
         g1HRLLAj5TDAIjUdG0NgyVt9bJNehr2ssXRjVL19Wy0fbVSPLt6o63qTPW/bNOt5P83P
         k+Q8etUIQ3Hi6/TcgZiEwv/bbhm05KZTTzs7LnvOunoehE6oygUdDA1BoFzeMimPXN1N
         pY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132361; x=1791737161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=WE/fwl/paBaBwDwEHKWM3vCRYjbrfJD7ML5GrKxHiG3xED8SGVrYTphTwSuiYim/84
         0onM/OK8pAZG32b8lj4zGbwxRbIbWRqm5Yilstm86VHUksWgjHLlKt/da0uKhuuDQOeq
         AJa1z0bF0xRN7bOM69PaMb3CnNt7Kq9uA9s91O01wTmD/4cSu8NgnBY8M5Xh2A4P1vgB
         GwRPo/m/my42256pWnGu1qwadOapyXGkm2yhRmt4WX8ndUJ3gdwj70WnJppjlUIlwzMx
         ocWNue5oGsmtzubeqz5X/BgiTFKVT5ziw+pv0aSJEJkhXxETdLbMgGOZkhVWfFeYnGIa
         rtBg==
X-Forwarded-Encrypted: i=1; AKwUvBwjip0B2aikPnnQBXUpd/JfjNO+ktxZmGW09m/6c362hjA0rIsI1357p1lm6rmsVXR45hg=@lists.linux.dev
X-Gm-Message-State: AFuF++kXIbho0V5t63N9wzi/c6YdCBtDqsnsYXFFU0kcMtPVgCJnsIkn
	uGna3VVckmYFZiTPqgKW5OwNZxe8ITCqy3immaHpmKMGym/uEaRlP0kA
X-Gm-Gg: AYBFou1MIEx563Tx8Me2pj201G5Ohaev+Vg24RO90GW6upMXDMGoCVU6nj151H9UT5u
	ttY9q/F+9Til4iOv7gblyH/gIsoSdkGaMHk86YXCYlnpG2ZZntVF2LlLyYlNGa3LU4cBEl2mzjc
	txY/SAF8cbm/zqPGfETwlWAbhXlImZpaIfXenSW190kL4MKcHOOrfthr7EWyt8A1LK1PZkPHgTZ
	9wnE8CG973fHAB60iOTbz3+HXZy/nooVDQOKIs7yR18CIYifKvo2eXQ/3Hu9V1Q5RwGPbW+Gfz6
	3shJ0RKsN41ohOiXrhISlrUDgkbNl+L5ghh58Bw79sphbk+SPG9ceaWTjin8ywYSCG4/HtN3Es5
	9d6LUQWttmKW4MywaRnycQR1pQFGp/3CHnZi1GaGXOO/LNxrVzAIcRiRZBiZg+CuA7Fc2KYPEEa
	Ap7O3VeiteucuIwDJk1IfPA34Q23PlqW88nGaO8N/fm2+MkbWryzV3Qfap6yQ8+W6ikBtLm5VTe
	LD/WUkZ8LV05JGr6QpXSBge336oNQ==
X-Received: by 2002:a05:600c:c177:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a168103397mr86677335e9.29.1791132361371;
        Sun, 04 Oct 2026 09:46:01 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21801435f8f.13.2026.10.04.09.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:46:00 -0700 (PDT)
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
Subject: [PATCH v2 0/3] mfd: max8907: Schema, pdata and poweroff
Date: Sun,  4 Oct 2026 19:45:37 +0300
Message-ID: <20261004164540.198446-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  38 +--
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 309 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

