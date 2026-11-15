Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733317;
	b=DGQTtBdx+1irr8Jy4fo9ABhr4MClTSLNe55YxJQmBZ3gVbmnmdh1FwOGBplT+5R8fadR
	 XvBPOk4coHVw8UBW5u7X4D74NrjZxaPSL1uQ50oFCsy+Bo/0HPdsxEbbhpJbtRNXenGbt
	 AzwuRvTWZX5a7GnOEgltEQWAWaQv2eLnyn8Uy4YRQdpyNVzLWAHsRa6SlN+Y6D0CVq1i+
	 3UBfEDRAQr+cQG6GwnwmKd7+snoS4krTEyFbsad66labVvxz3TUtgV6ED159DRDdnYzN1
	 Cf8tj+TeahIUbFmr4IrAFFzN64OZCoIFEzOkkW6MeGa6w6rcejk7CLQo4jeBPYDHM8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
	b=iEGzCJltjxdv9ioj+N0gWrWktDN4VImZ/KXXhArJWZWJaOdbWaVeekkZXc6ELSgueJgB
	 F6HxQjhMQybJl5MIViIL79p55Tvc8/YLfsJFjJrfmLe+t1/Ba/wwtvRE3gCnu8109DTZu
	 gsb00hL8Pv8OrPAiZVIUCKuTHjFLWH4pa8NvYdp5e8sSzgnwgMTtyMhKI/oeGA+cc2gSG
	 50nDIi194QoASD8RxXjAHBAEp/y41rN059HI+HWLYjGB8xq2hQ+FIl0Ogr+z63OvRKN8B
	 9kBuZ5S/rrfQv4q7qER0NbTX4fQGmDEwVTf6h5i67oa1Y3TJuNbrJ43AkhnEfgMmWqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z8J5uWo+;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088B606A329
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F088B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z8J5uWo+
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5080ef9b31so447578166b.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733315; x=1795338115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
        b=z8J5uWo+RqNYtHmamgVM5xbKTeWlYCnNSQ5QY7HoENyEOBZ2QYg69+MZywfKL91hla
         tRVHsWzE6HuMzeTipC9k3RVA6xXPKDZE/nxkK35q/tPo7ym6DjCReBoTpF9hLpiUpoW2
         tNLdG4y5HC2f4mz7KOimqmUsc5KblWj2seXJ/BoiqqUv7ZDcp3XMdo13Lx2mnGFzlxoJ
         gQEOWp6uMZhMShp19QAH1vehemrWIC8bEA5QP11IFNk3keuIT8/HbyWt1f+oAVjEcm/o
         QnqjEthwDNK9O0lQ5s+Lsb5tj3tUuI/724hjItMadikSPCAtkIsoA2rn+WGH7sMZOq9b
         FbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733315; x=1795338115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
        b=mUGv/sCNoUjo2AWA5PgIY089k4qsiCt6ZGolaJ6ENVKnSYjh8xbNqmF317pDSNs1SY
         yfzouLpgycR4oBJOIlrkn0Qcs/F4CZcu1tIw44q1YTmBkN8u95DMITyUg1xKo3XiZRV7
         ByhU0rqOgUOiy5Q/JcOoAYZs/4S5hZxlt4WzhpL1kY3Xq7LrNNE+zuei0qv2DS/3ATn2
         0NzghT5fNEBNZp8TAD9XI13iEnuzJn5K74iEdg9o23DiAek3iblmsxcfh1YV6x187+Q4
         6qI42EscmMjd11dbal+tsSKttoOfgdQ15q1cbdXMxbXLbtliV8jTl6X1SeFtRpl3AAvh
         N48g==
X-Forwarded-Encrypted: i=1; AL+hErFqTAL/kN+OOyVUpwpLGIFgEM2nDYbr/dRmyB1W2xut/FWrjZmmdKPyWtxdXl04+10mk0s=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Sovfc+aHrx+NZFD66NWKXRgLeA6+P6LohWJzdsWLWy6eHkQZF
	PFvw875UyuFgkU4U8nHe0k5UNNrRbBT450GCxdIn+KBtFANIUEVS2e3y
X-Gm-Gg: AYBFou1d2o4PkCQayk4qtLF+TnlM3FF+TdJ76p2oIMpEvyDOj/UVF+JbHYLXC3bfS/+
	sKBFylQ94WtPEfcjUYSaBVCfQjSPAhOBSFCsvW6t/qNQV4Fh+sEjYg5lRDLvfEd42sasPd0JIlC
	v8pSD6fmBBdwN18K9Ql/o+ipHj1fAyGwTAr/LsoXLfdLortDwvaqNazbua6fbNudsEjHmgMAOzC
	HvzVjjLaYo4PQoLbkDmfsyS/Eztue9NAJFLN8pIzbeLjxI4QBBrxb5rj5Jk6xqbHbxIlr0dd71O
	4DICgSLihwGhp1htpTbOf7MFjOYSkZ1ME5OMn+Iq9Xeh6PNACC6t3kb0N9VpCzDyTanQUmGPGCO
	yLEacR6wZeYiZaJir6iOUvDWH0prtaB43Wg/5d0whXZH3Yy1skoAPF7i5aAL/s/91Aac/vTLTfn
	Djqx9Ea+PhBsWYma2DOCb9GV1ONWcDafKXkoQqovrlGprHywybzp/S/EtqPArUzNtWgiS7YLJiK
	HYlEsmGN+dZzbAU7LlNhjRTMN+ju2UWN89vJqceFoAb4dPoN7pp7V5+tgGKl9KtpM88pXMCHM9B
	8GpoMQZSJfffwaSLNsb+aVXBVEvRpxC/l5x0yc+8+idh/SN4AbxgQ1tQ9VoTGW/yej1HHC3XokG
	vX6oqWL3xJw==
X-Received: by 2002:a17:907:944e:b0:c29:22cf:b0f5 with SMTP id a640c23a62f3a-c509634ac8cmr591328266b.33.1794733315249;
        Sun, 15 Nov 2026 01:01:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:54 -0800 (PST)
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
Subject: [PATCH v5 0/5] mfd: max8907: Schema, pdata and poweroff
Date: Sun, 15 Nov 2026 11:01:42 +0200
Message-ID: <20261115090147.95337-1-clamor95@gmail.com>
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

Changes in v5:
- rebased to be applicable on top of devm_kzalloc_obj conversion
- added restart handler
---

Svyatoslav Ryhel (5):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler
  mfd: max8907: Add restart handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 176 +++++------
 drivers/regulator/max8907-regulator.c         |  11 +-
 include/linux/mfd/max8907.h                   |   6 +-
 5 files changed, 365 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

