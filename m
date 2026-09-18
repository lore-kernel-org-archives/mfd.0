Received: from mail-pz2-f26.google.com (mail-pz2-f26.google.com [74.125.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455349A3CF
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 21:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765309; cv=none; b=YHPjC1yfTCDw8Cgyay9zOM5AA2WtIgmWZtaIogvFUcoMoEqJgKgEL18Wv5Csf1gR9LLSXPHKemBe1EQDuLmn0X1xzBEiHWBadLbSd1tcaZLRh8WzdShQ5Kdg12dwQT36q8lIXfrN5fZb3esPd+d0F6vQWX5Vewx+ncpXDKnJ/mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765309; c=relaxed/simple;
	bh=ZRyjLwuWb+X9g9IpWHeNCy8T/E28/fkf3KvfcIaopTA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ix8raSD4VVCCOpxGH5piXezxQnWE8o3AEnx3Z/2rmfuUPpFQBJLvlhe8PbEUGtV1LOgRGjDdV+JAeeptty6hhNKwr37Wr3Dcx3XBQFidExpJVaVC2Yw/mWZk8r1p4BvcqN1On8DfSF4rOFSNtloKMBk7pNJl4s616czr2sI/2VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuVJtMBi; arc=none smtp.client-ip=74.125.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuVJtMBi"
Received: by mail-pz2-f26.google.com with SMTP id 41be03b00d2f7-cc1e1b51234so142146a12.3
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 14:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765307; x=1790370107; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3WiUysQa48NgmiHeWEdLUhz2qNirMR0WRXFvV2RF1mM=;
        b=HuVJtMBi240QClYh58p6ItXNhQ2z1MkVOnmb/mXuMQp+R+vynZNjBHhuAMxP9eYiAQ
         ZJE80+fYUsxQfolhJodE+S+AznIqP9qbziZWNuHPPDaJ4Gzwfp3tAI2keTjinz18Pw67
         jH92hW0yJ4TjF5pGQ7t93WcB9OjyPiqA7bgJNikOsvJaM+g921JHAFLEXMnGW1TGjhqD
         LVOBAJ1kH/3qEFTEg9skW27cVEV6fT3tQ6vmijVVJ8T99L34e0KkU7kOTL9wV2W6jk5l
         c6XVe9IDSWMEhIjWPKPE7jFitd26FPOKRQ0JbTRWQwHBui0av34SWQECpjkGUkD0OB5b
         YFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765307; x=1790370107;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3WiUysQa48NgmiHeWEdLUhz2qNirMR0WRXFvV2RF1mM=;
        b=GO5wAsrh/UeVUXOE4NbWC/zRa3EDDx+J9Lu1ecwXuInCLgbFWhg2Cc7QVIWju/tCBr
         MFhj0HVh/2LKqpk40XkPbTSsLDw4U03vAE9kpnX6E/Wi5IEv4ei2Qp6bCTLygj+L6vMg
         5D46k/xTxT93Y9Owa3aHaM0gz7MUkHE4W3z4+1JOFAYt3VTw6jrCuhglPaQNbJSztssU
         mTlDyaUCLfFBNTkfhSiuBJmXFxkkMIcW3+8+BFZbkVDaM49076h3a+ovbS0t05mXoXsI
         hbUowgGSxM4D8/5mO52l70C1hEAyIKWDJZb2LRbP1IJczhLq+Z0sgG9hzyH2XM+5d5c1
         zoOA==
X-Forwarded-Encrypted: i=1; AKwUvBz1L/M7Ca9tRQ6E6vHvH9ntUEbLupDHKFi0YLbIRtBBRtphqIYT9GaKmQ1j2j3KqecVIMM=@lists.linux.dev
X-Gm-Message-State: AFuF++n6pU87ebVerXOYg4OnBmybMUhc16fIBNisDNtgX2VOqOrECLmR
	dVgJ5vxPIN5i6im3PyV9lOu8LjE2VD+9toDisMwBMzTdmnSoiXh1QKQU
X-Gm-Gg: AYBFou3rrbTgFuMMPQZDAjBF/eao7RLy92YOJ+GsD30xUUEfJ0RzfDFoupgrsiIJCW8
	KONemQUvPKqEI2umoLbye/12v5o48GcRT4+D50957wL7NgtF6nPaWP5Ba1FBntvUFgspJp3bNRz
	5X+O0pKts0Su8nefkwgqklskD8HfZ8v7zF5HALRP51em3cGkFVQErsHOuUbj1xxUNWtLbAiKMG9
	viamVThdf9gfvrBFQbctqn/Wv8BomQ2/eyxouJbBd9p6igUif0u03tpSJEcbNLQ4QiODKW9r8m6
	T4yW2P8A+CyKbSCobpQaRPD9sMGlPNuyyhH/Xeq5iRR4MDUJO48kwPJ3O7LyAdSanmoWWUCb4Hi
	shRf2PjKBDiCEH069S7tdS75yUyjChJw5ovFR9luC1+rAYGhJG9jroz0vIstVosDmMkqX5BVnl0
	ibQ7/P++kkczePzsYMWYtVbZirees9mDKZgz8ZvIkW+F4NeSQG+g/yDiT7ATW025ThBRytxsoEK
	aHC76ji
X-Received: by 2002:a17:90a:609:b0:39e:b778:2b3a with SMTP id 98e67ed59e1d1-39eb7786460mr468341a91.6.1789765307417;
        Fri, 18 Sep 2026 14:01:47 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:01:46 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/4] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Sat, 19 Sep 2026 02:31:21 +0530
Message-Id: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNyw6CMBQFf4V0bQ33Ugq48j+MC1paqJFH2tpgC
 P8uxRh1OcmZOQtxyhrlyClZiFXBODMOG2SHhMiuHlpFTbMxwRR5WiJQb6ifHM9LPlORM1UAQAW
 FJJsxWaXNvNcu1ze7h7gp6WMiLjrj/Gif+12AuPuU8a8cgAKtMikYFxkKLM5tX5v7UY49ieWAX
 7cC/u8iTakGlLrRgjEuf911XV+ofasx9AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=1955;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ZRyjLwuWb+X9g9IpWHeNCy8T/E28/fkf3KvfcIaopTA=;
 b=pDWSttThJKmSFzcPLOWIIcnuPe6VgcSiNvLmer69KwJPqMHHUZ5ptr/3bl0iXCSPyu84XHxru
 iuqZob+NJ0TBIt47S6zvpR7aVJgVPcmTD2rBdOtTLbQf/sqkllZYKhf
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
Changes in v3:
- Patch 2: Add '>' to description
- Collect tags
- Link to v2: https://lore.kernel.org/r/20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com

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
 .../nvidia,tegra-regulators-coupling.yaml          |  74 ++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |   1 +
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 7 files changed, 292 insertions(+), 204 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

