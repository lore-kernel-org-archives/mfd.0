Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027794CDA27
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564206; cv=none; b=cX1NPAyCEhIBnjiNtoHS0EhVMmaXagry3fp6LSeG9HOQBrLWOvuJ232L/bhJTDLVN952La8RntoXUw8zYiSFzmz4U4D/g4z1AmaQ5Iz0CrkdTnmqPmUZ/qVCqyWdpNIDxYfbkKcdM577baoPQSLFgNmc1XAlBTIX0MucnSKOe9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564206; c=relaxed/simple;
	bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GPXr69TEzF5uYPeFOgjj78xhSNL1s1SPOK9fChC8C0JmqfSRFrAUTFIQjwANjdcIEmitcBboNsnwrFT7eSTC9aJ5zlwwvXPY12F8xW2aDQS78vrgJJ2fiPbzxxiOp+Lu1P0nRc1ZHq1ILC3S8MA5dSb+1KwDR44Tr8GeBHc6pZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOsFwWAF; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOsFwWAF"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dec5de01eso167159a91.1
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564204; x=1790169004; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=IOsFwWAFvASxXR3Ic7/Y95CvzsYum380/22FWkO61tIMcM27D301Kv0yMNt6zzxVp3
         vj5cjPY0IeB1h2fFbG39eSxoG8mkdvSsLNiHmXmTaXVa39wDoujouJPI6h9TjfW86MIL
         I+6gic8g3cvTWppwobADM/c817OAKp3fU/tW4O9Dv6sohocrdXw8Hh7TQeS57kcaYAxh
         YwmHuCPyE2JSQJ5K0Fq8h8ORkpN/2a7XTilYr+qIhHAftjW+lng2azXBnq5qhQaRawlx
         4DUcuxy2mIRQfCVkuZVRZALWmZqzvbH3lKUmObkWRucRBwsvSmIEnTD4WYVP6kYOM0GF
         Zayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564204; x=1790169004;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=s+MtoPTfW4hqOVn+dULsMlhwezdsJGEJiIHeweejrvCNJEL51mvCccwDx8tHz97gfD
         PjgGv3NWAKLFpn2yWJqL04krmYLD0jQDCUbn5e/aIUF/Aucf0FsojoMBl4aAi16wyhn5
         Mvce5uib1ww+o+4R64QBfb0dFW0UPu8WnX62ZolIbV0tVM4Zo0EL/pzHvUQ2SXQaALWE
         pHnqXPq3/xX1FnLvYZyZ3umcxJ82qEOFEHaYVfBiEvAii+grxzaW5AAVmJFx30/iGaef
         c8FOT2/5ObKqYYPGITeLkkUFJJwQK9WcC0sBWkVkDR2Kjrj1VooCuQxVscmhHXNyE6NG
         dptQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhoO8CQJrQTidY8m+MfI5ztQfBE4qGvSQNFCO0XdX4CDFt9sksrsv7XG+Sb8NOpW+/wRQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kHrdRfALV6yRjIGtwNnwkdhG4rzEaAFTKF2/jrbWe+UfHsKQxf
	F+WKTZ3PnIkQ082idMwk4dPk9vuHWTBI9oFsMGylZyxkerFRcJhJEO26
X-Gm-Gg: AYBFou3RPMKn4g4d50Yoj8bfeGUD10r8XQaqs7X3V4yeF7UxcR561ed8GMHsA/dQi1P
	hb5svLfiUy+6zwPh48S+pBw6Thbg/NKh0IJ1THgeeAwIXmnIzA54pfCMgjuhO65kItqbeQGbnmc
	B1pZowa3HPoZV49q5fXox0lp/2gjwnbYsNqDIehNXxRxhRwpUKZMCRC5+kRw3O6jvGNTLjV8+ne
	ylYKV9g8eiLr2G2bE9oObX9ctYg9ZBmgLtvXCTXOamT5OCRux0GYkP4be/3ViSBfQjF6i8cXRTf
	t84fFo32NXaMXcfCj8QQRlLFkerEr+a+EHL119lsR/RxLjz13GtO67k81t1rrioVuibXuKzEpxh
	eMAQFz0Q/XYA+kiHDepZxSnHddyHMrKXLrR4nhcnmxHhYX3//oPeLwHVcbgMbMHRjzncZvW8sxY
	LIR2ZaG/b20ozrreWM3htjV9dNndVJJozeNx5j7A9MKkoDizsjEF0rp+b9huPzYFx+6TGFOqXdY
	9D+cFWMfjg=
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr3893628a91.5.1789564204084;
        Wed, 16 Sep 2026 06:10:04 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac47cfsm7186272eec.17.2026.09.16.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:10:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/4] dt-bindings: regulator: Tegra coupling DT
 conversions and cleanup
Date: Wed, 16 Sep 2026 18:39:30 +0530
Message-Id: <20260916-ti-tps6586x-v2-0-31b98eeff7f9@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBBFr0JmbQ0zQAFX3sOwoHWEMQqkrQRDu
 LuAceHyJe+/P4NnJ+zhFM3geBQvfbcCHSKwbd01rOS6MlBMOi4IVRAVBq+zQk/KZCnniFhibmF
 dDI5vMu21S/Vl/zJ3tmFLbEYrPvTuvd+NuHm/Mv2VR1SoysSaVJuEDOXn5lnL42j7J1TLsnwAk
 5/tUrgAAAA=
X-Change-ID: 20260821-ti-tps6586x-b54e7111917c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564183; l=1796;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
 b=h4Sn/Q8+2ydvx+1ai82bKpETRX2wqt/JMINlNqyzcv8hIJDj4s6LN8xR6iCcdiEifDU+WPAA8
 q+kQJQbpTG8A+Tl4xABPdsdK4NYgXn+qtCJTephF3KBFkOC8QMLm06Y
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series adds a shared DT schema for Tegra regulator coupling, 
updates relevant PMICs to use it, and converts the TI TPS6586x 
bindings to DT schema.

Summary:
- Patch 1: Fixes existing TPS65910 validation warnings.
- Patch 2: Converts Tegra regulator coupling to DT schema.
- Patch 3: Updates Tegra-related PMICs to reference the new schema.
- Patch 4: Converts TI TPS6586x to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Add patch 1 to resolve warnings from TPS65910.
- Add patch 2 to convert nvidia,tegra-regulators-coupling to DT schema.
- Add patch 3 to $ref to shared schema.
- Patch 4: remove individual properties and add $ref to shared schema.
- Link to v1: https://lore.kernel.org/r/20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com

---
Bhargav Joshi (4):
      dt-bindings: mfd: ti,tps65910: Add wakeup-source and GPIO hogs
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema
      regulator: dt-bindings: ti,tps6586x: Convert to DT schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       |  20 ++-
 .../regulator/maxim,max77620-regulator.yaml        |   5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 -------
 .../nvidia,tegra-regulators-coupling.yaml          |  76 ++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |   1 +
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 7 files changed, 294 insertions(+), 204 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

