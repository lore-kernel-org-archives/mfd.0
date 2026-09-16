Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CDE3A5E65
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564380; cv=none; b=Z+k1MeouMgINTjHeZygqiXvOUYwVYbz2vrtI3xBCOaRkwOtuubnMDXfxrmSHBLO1LhsBT3yH4dbjGeNtLNw1ec7zUNcDOAA5NpVb3D1PYYfVFZm5d2mKqFg2Bs9Xvg3xS5XX96fUBtK+xkBRSgb3qdt0XMGnvJfFsbMp7dNUH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564380; c=relaxed/simple;
	bh=o+kUdx6oM4YKDVkr1OH5tjWm5SLV6fOsv8ZE8kTFeXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5EKqk5hURKriwkd4lNVRxGKFvRJa4xU99wTTA0ZIPx7aNw+9J9XG5dRLhMBSG+TST29MaHo4vwHgB19FHC2rY6I1pMTvM+YblXDWvuvxcdxPjl16kXUmtKdgbjiX9zNrV5quL2HSMkSkcIPteN+Xbi201lgOnrKJQw3+c9UTLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMo3dQyc; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMo3dQyc"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a810so70881a12.0
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564379; x=1790169179; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK8SlgHAeovTDqk6LwNJJCxL6zYMCFEkGRKFkqjjE0U=;
        b=aMo3dQyctJ7GzxoUvcsxlMns8Lrqzg2VwQM93Wzq1fxm5DoVYCOBeCcSp3+x7pxPhH
         9qPXT7p4LbvSBsbfyasOsInZLhT75QzQdetONtUrUNkUqr35vrzUZhuCYqXnPiLHlpaL
         3p/2msAQnesbmnM/KR4WYXZya/IUrtw1aqD+oN47ZiX2XOwKHZcGDwPRqb4z97EV5yKg
         CCWIov3L1ypD1ZfLp7JqdGk6bdanHCxl1Q3d2BqEVZB0hptsBN7qD7CjWZpB1WiYnIH3
         pp5dQrOFV6dlu++Q6OQx4UQAl7Dl8wZoh2Qe7LUWfY5oMpc5THmuKmBzg7LxVSypab+7
         xT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564379; x=1790169179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aK8SlgHAeovTDqk6LwNJJCxL6zYMCFEkGRKFkqjjE0U=;
        b=bUDnD40emZwgOGnZ56R55bPqJYt5N1aI08sosncVAQCM8Rm3PRU4bskVC6ked9aQlp
         ahMLyGtYwbZk9g33vGH99Fth+u+forHF5D8gxs5mqUBpk1Gnii+pC4P4dvdPkcrIk3Hi
         lgpQ5J/dYl+n3djjjcS2ss9ZMZ/R0Otcd99jMKaqXIB7iqwQbYr1OG3bBAEvP0Gxuzmz
         Tv4diNMdvCs6Rvv2HjTQaz828Ni/Ay3Pu9tHv+tzVAM30EUqe7qA47zKvXv9SEwj8soR
         VioQujEZ+L4Jlp9Nn3yUttw5iAV7OGkN+NIc9gS1G7P4D7di4Z2Tw3Mty1DwUdbH2KNQ
         vuOQ==
X-Forwarded-Encrypted: i=1; AKwUvBytkDg6Juz49Mx6GEZeZcrtmWzImvH/E9ReR1wL0wLpaYX56m97GPv/2ooYzgv6RT3c+mA=@lists.linux.dev
X-Gm-Message-State: AFuF++lCZRN7Krrsuat2iUyBGHH40wnr3M9FVHvrVUVmeqvNQv9d16YX
	eFVpP8caFECV8b//B5jFSTXT4M9uQqq/VnpvOKDnYwTLdgG7LOm7etfw
X-Gm-Gg: AYBFou3xn0yIWkTtAyeHWI5LryWIWV3MAJKIDvAi4g979dpJcEnLtytz393mgNnxSig
	/vKQUHnVNF6MEMobeK7aHIi7A4wZ1/H/BpkZ8qEMpAcHjFvXpKZ0k25sgTo82xvTRGplSnw7Rt+
	PEUz+2EVBK0v4gaeaRl8NErsptosDnkPnDTyZsrrv27yyLpaRutpVIJa6KsMmh0IWiMjYh1Ko6L
	mekYOXLnEc9ulaQsm+rphiyaJeJRgxM+zLTION/lHsn64fTY682GcYTnyy5xA31mWB1zZmimJI0
	qV7vgbw+TZ3ajr7nj9BKWBwF2Ue47K0Nc6j/m0XJHP6c2PciHLeVqLPX4MJng4g14K/A32qql8Z
	D9BJJOQYF7njY3/jT1E00WLzSEimrh21Cxvl7f9jhQG8M8QpxtBCi1Kn0ZY46riaWfSJuozPM8x
	P7sJ++jXzOI69R9LJzAmzr4yhHvoe3Gk0ZOef38/rFefZvVwCONNa3LVUc0khm83ZuTMc5HJSR+
	6Oc4CoWB+0tv/Jm5LzarA==
X-Received: by 2002:a17:90b:2703:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39e1e4b2c56mr4218286a91.3.1789564378929;
        Wed, 16 Sep 2026 06:12:58 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:12:58 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:26 +0530
Subject: [PATCH v2 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-1-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=1169;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=o+kUdx6oM4YKDVkr1OH5tjWm5SLV6fOsv8ZE8kTFeXU=;
 b=tpEvH9KHIwfTAC1OsUi5VlGNptqy0s24Wwu1XzlMVjI2obaXalmbeok/qLK/BloCX1pzhu24l
 n4BFew6fQmaDo3lR3iaTnzSxj6vIqAmT7b7+Sj4GzU/TxtejoEVXMtr
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Device tree validation throws warnings for the TPS65911 PMIC on Tegra
boards because wakeup-source and GPIO hog nodes are not documented in
the schema, even though the hardware supports them.

Add wakeup-source property and allow child nodes that match the "-hog"
pattern.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0c..caff9dc0b2bb 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -37,6 +37,8 @@ properties:
 
   interrupt-controller: true
 
+  wakeup-source: true
+
   '#interrupt-cells':
     description: Specifies the IRQ number and flags
     const: 2
@@ -163,6 +165,12 @@ patternProperties:
         vcc7-supply: VRTC input.
         vccio-supply: VIO input.
 
+  "^.+-hog$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg

-- 
2.55.0

