Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184404;
	b=HZujnTPeNWYWjXXQBQ+qxkJAW4KVQpunp75mW6vffzQ9Bt+mnVUxV4vsp3zGAMWKE1O0
	 UDxxEQB/0ykxyRJ3MAcnHT/FBoMPGHB6qdwZN70n3Yrw6fLuGNvF97cJRlfTKbMMhYO+8
	 7vjpMG1XIOmeiObCC5C4JU0VoX6vcM/GM//WFvIWZd4uDGZ8yYMC1KPR3ZK6mwvm4tl9t
	 TBewv6R3QBykeog2yjQCl/ZJtq2QARAbQqtBf5bkddHVgMy0NnwkaH7/h17tNlYWTcsSD
	 EBN4zKM4ntGnkoQcPMD0XKRlhwPq7WsQOdKzWeulkdK8T5sKhNEYymqSOBYROQLDAhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T85WE9/4pIgxBclKw2OPnN4ipy1Bde6FK+pcC/DL+nU=;
	b=vN9XVgHXeBUdtn8xnn6Vz0iJPETFIFBFPfEbZv+LvUt+ytktK7ZUgNEHLthN9uNJRQwW
	 9nwl7gg4ELYorqr5tw5M/tT9QuyD25h6ZTIq/G3Q4o3GnWs5jdl4ePzI9ciFrpe2cH14d
	 4KJlU96XAiZgYTAVfI+kSIWFR4YUMxNXDwi3gOSq3cBDpC4sh3QRDu/v9SzeKirD7x5fv
	 8cLF+15HFlVnEE3Ehm7YpT24+ifwpF7YoTQpAOhCaG1pUHx59NNhwBk9ZtBQPEHj57JRd
	 UWz5NNENspLkM9lbY8FutghdQxJKJYV2mH4osCFY0wUihVapvGa/m2hJaZFomA9pszA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hezsC7bo;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F469606A320
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F469606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hezsC7bo
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4918c2d727fso134167f8f.3
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184402; x=1794789202; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T85WE9/4pIgxBclKw2OPnN4ipy1Bde6FK+pcC/DL+nU=;
        b=hezsC7boepPgpcRvvN39/aKb0CoKe04t2QB20LovsBfnnNZ1sZQth56sgh3EGc02xC
         D/drXZCgLmErwGfWLF5ZxtSFM9iNqE9d4pFGQx/XrGmXCCdl6KmjjyVpk8+Y+hIyjYi5
         GU1cGCz7/K2y1aDthf+vdh5VcToz52p+8MQSdpKguzHge66ZKnG0Gu9fyzdyxToZLUCH
         5RotKFcY54aVMh9KRvYDGGfRPkiWNC1Qk/lJ+2wfHV7mocBBT2D2HJk5pnMjzMU1EW6g
         pMkjUVpTvtJk6vAxDyEkbn+lm8DXXertFtP+4NdDKKq3zOi3/X4Y7SPOBpL6GmtYpMCM
         OCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184402; x=1794789202;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T85WE9/4pIgxBclKw2OPnN4ipy1Bde6FK+pcC/DL+nU=;
        b=JhZQz0+Wvcwuqo5petuRHzLxyNnn7yMBTs2LFSdLgbU8t0GkPsm8zjlNKxlxB3jwDT
         QxIZJ7wkLsvF7H1fT5iHbvwntAZpDGo0cl/aPkK0sVkrrDwd/UPvTbgIVmM11C3vjSgi
         HhZpoXUfOHXdpAQlqh+n86I92mLUqJ4fx4aShMgYe8r1jZV9lnbODZkzl2xGNeenmSrN
         SsXu5+DQ884YIh7uLqBKOu8dXxw2v8DmYF6zeGD+z/M1nemTgTGH7bd/Zm85LHfb7ejj
         CufboiSa6ETyH8fyJiIb6Yez8IBOmrDH1DRDqJEjyaQQobA5Fi5c2dk9aKsNcXcTI697
         EZuw==
X-Forwarded-Encrypted: i=1; AL+hErHeRJHFOTmYOwQUj7RE5ai+esVL4IlMjEzJ6CB+qGgLxPfCD7BJ9PWZZCKR4fQROL7La+A=@lists.linux.dev
X-Gm-Message-State: APuU4Z/4AXfZymuPreccht/fzugoHqLRsJSxy9L524MByW25YSDt00oh
	EFwdDMuUV8F27MH0Q+sb0hc8nH9yXi++COgBVaccg0PAoLbIo0OUG5MU
X-Gm-Gg: AYBFou1FfNGVijKBHKrRvBLBTAWJEZkVyMJKDOgPHN5Hs7D4FfHGHYAhgDMnrTieRHr
	6mW3LgIU33ymNeolPPx6WlOUW2oKSfygjZ6VCJar4Udg/3KAiwGBuUxbtsXe0RB42Vq0zHRNsBt
	rnl1D/sGkB7ieS7UT7t5Ybe6eN5pA+f5f7IbjTAbauTnUK1dEACLjdroEXttYmZYvKBK9fiKUbh
	bNbtb7l10hu7owjX8Xr8R3yTq+6Pxrw82X1svhbBceH0PDn/n/doGLgrj6ovxt81Hnyt4O80q3s
	E8rqlgQENS4ilx5sr75K3YwwFvjg/lXwzmiiHIGtqnfBiRBMEdCQbiK3NJ07DSVmCRKpqA7QPWY
	fUg34ebBox5QKfEU258T6JOyVkeFWpLW66AVSf7e292XKY+CPhr5La7/4KbdoQPNpVtlybFVOZi
	NaoNb1mlGbmtCoveTTIik83k/dhw1ihJHEzGCs8KROJsNWT/syunolp149XhY+GfUDuFFQIOJBE
	trRSugzrn2Q1ZLp4HVz22eVVCadPYPcE0J6/rzBMT4uRcvUD6xxzExdmLQIruPSy6Gm3yPJhwGB
	C+OBDWDGzwmBq+DP7KP+KJ668hQT591dVAvJLKb4
X-Received: by 2002:a05:6000:613:b0:48e:1b11:7ed0 with SMTP id ffacd0b85a97d-495895866c8mr4919311f8f.33.1794184402019;
        Sun, 08 Nov 2026 16:33:22 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:20 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 00/17] Add initial support for Qualcomm Halliday and
 Samsung Galaxy XR
Date: Mon, 09 Nov 2026 00:33:12 +0000
Message-Id: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgU8WoC/42QwW7DIBBEf8XiXCRYA8b+lSoH2F0aUjtJDYlaR
 fn30iZSK7WHHEc7b2Y1F1F4zVzE1F3Eyudc8mHfhH7qBG7D/oVlpqYFKHBaKy+3YZ4zhQ9JtUh
 2TH2AaJGUaMhx5ZTfv+OeNzddTnHHWL8y7o6V306tp95sPzVT97ekzssiE1jVD6ZdWE1nLX7/9
 h+E86vsHehRJZMs0SNMRpTOBmsMRPZ2vDMxFJZ4WJZcp8458DyQQRfBoiftk+6N5baAItAexhB
 4YCM21+sngQFSdFkBAAA=
X-Change-ID: 20261108-halliday-dts-e6ed3a2b5cd0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=4240;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=pd8aaBJfTnst2NyWFbIqqoDWH9f0rsjbQVRvbO1ZvfQ=;
 b=ziCTgeR9INftAl++nhbHMRN5UuuOAe9O1l8dAZyqzOQeSOXOhqEJoZb8ANzg3vCtU6bUiOnMC
 Z8pj2yNgEeLD2PYELXx3W1Ha0kiVJJto65DrQYeecHZpxNAkqkfVYCX
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series introduces initial Devicetree support for the Qualcomm Halliday
(SXR2250P / Snapdragon XR2+ Gen 2) and the Samsung Galaxy XR headset
(board compatible "samsung,xrvst2").

With this DT and the driver series, the headset boots to an initramfs
with a shell over USB NCM.

UFS, cpufreq and the thermal zones work too. PCIe with Wi-Fi and more
will follow.

Dependencies:
- The dts patches only need the Halliday TLMM, clock and interconnect
  series:
  https://lore.kernel.org/r/20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com
  https://lore.kernel.org/r/20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com
  https://lore.kernel.org/r/20261109-halliday-icc-v1-0-def7cf786f75@gmail.com

The SoC ID was sent separately:
https://lore.kernel.org/r/20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (17):
      dt-bindings: arm: qcom-soc: Add Halliday
      dt-bindings: firmware: qcom,scm: Document Halliday SCM
      dt-bindings: interrupt-controller: qcom,pdc: Document Halliday PDC
      dt-bindings: power: qcom,rpmpd: document the Halliday RPMh Power Domains
      dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
      dt-bindings: arm-smmu: Add Halliday SMMU
      dt-bindings: usb: qcom,snps-dwc3: Add Halliday
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add Halliday HS PHY
      dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday UFS
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Halliday
      dt-bindings: crypto: qcom,inline-crypto-engine: Add Halliday
      dt-bindings: cpufreq: qcom-hw: Document Halliday CPUFREQ hardware
      dt-bindings: thermal: qcom-tsens: Document the Halliday Temperature Sensor
      dt-bindings: interconnect: OSM L3: Add Halliday EPSS L3 compatible
      dt-bindings: arm: qcom: Add Samsung Galaxy XR
      arm64: dts: qcom: Add initial Halliday dtsi
      arm64: dts: qcom: Add Samsung Galaxy XR

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../bindings/crypto/qcom,inline-crypto-engine.yaml |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    2 +
 .../bindings/interconnect/qcom,osm-l3.yaml         |    1 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |    1 +
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |    4 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    4 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
 .../devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml |    2 +
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |    3 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/halliday-samsung-xrvst2.dts      |  218 +++
 arch/arm64/boot/dts/qcom/halliday.dtsi             | 1859 ++++++++++++++++++++
 18 files changed, 2110 insertions(+), 2 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-dts-e6ed3a2b5cd0
prerequisite-change-id: 20261108-halliday-tlmm-f250374110e0:v1
prerequisite-patch-id: 5a614cbb038d4083d1ce56b413923dfb4e7c2fd7
prerequisite-patch-id: 36f2dcc3de10d5ccba9eee25b73736189559162a
prerequisite-change-id: 20261108-halliday-clk-362190f4f5dd:v1
prerequisite-patch-id: 765d40b7543dba6580852939a5c3d177f12d0a1e
prerequisite-patch-id: f12c958fceb125bcefd8dc9de139f30a371f85a4
prerequisite-patch-id: a6559b14fa1badec8e7752940362d68306523557
prerequisite-patch-id: 3574a3f99dc1a987a61b4e4a73e0204142604a73
prerequisite-patch-id: 5ff25f591783dea61a6719bffe3961070f7167e1
prerequisite-change-id: 20261108-halliday-icc-65a5442be859:v1
prerequisite-patch-id: 94cd5dee75e96876c6a42852cf6d1b52df1c7ace
prerequisite-patch-id: 730c6d80310f7472ecbcfbdb84dff4cc864d99af

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

