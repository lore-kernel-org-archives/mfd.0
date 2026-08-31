Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3089D3F58FF
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 23:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219514; cv=none; b=iAkS7aCmEVzw8YBImXKPF4UTPuOM2aBm/gEH9pGbK5qsMKOJZaFrqAp4kaa+vEC7MqnZQtc0z1eEO4T+owTxZZiIcfyJlv5Fg0ZoazWC8HkwW3zM4MQwPY9DN2ffOxjGW1y8gZcqmNMlUs82GcNXGY1TZEiXwmtETl+FiKOF9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219514; c=relaxed/simple;
	bh=rA4QIuFO1naxnZ7iJUUs/gm+e2xWDF9gudgR2Nn64Gk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MqQSI0HQgKZTSFKMxb0DkAkxwOqxlcRDRMLqeHBJoMjoE7dLtIG7CpAdgjOJgw/5GHNeg+ZSQb/ody+4N0Citl80uzBeny08pvYaX10c6isqMKkrx2H5+5HRr7hOByON7kwl7ZOhNcqeUD/x0t+yCXMbOpQ4L/iAa3LSB/0+o/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWwMGXwb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWwMGXwb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384c94c9423so496658a91.2
        for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 16:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219509; x=1788824309; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=;
        b=fWwMGXwbQY1XVGZCHMW45W6IAOq3Rwl4Jngwbqtyu0/u/Jp5PrWYK7MzIg5kL9UD4H
         9RuA6wbqhC4EoyT1gREV2pWiWdhRqT3Kn41z72CZUMNiDNZVpcjyQXfxJ47dbRn1NRSm
         12ZVwsDxOEDHUlI9x6Bye2TdYuY21CaUh4/rlBkxEXRUPv6/pGSj92LihRpobWKOasWX
         XIJurw1trRxxTBSpKLrZ6bfW7xjTQXPZEDXrhQl/IdpXS6Yh1bamL3F9FJeGXFOkBlSr
         lQQmPV3wa600gy9M2xDrM1mfylBjAYA/rR7rDu6hPGOg5OC1fiCQfELoo4q/UsXg51WH
         F8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219509; x=1788824309;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=;
        b=N+okGXez6VzXCU06jAADTG39GyvuS3O6m9TXqkI6d2JO+a3TBnedcewU52wswcwtPo
         liEpPSNFYSIz4jdmjYCkJKzvG3By1Y2DI3u0vRpR//xpcvnyvoqYa7cFmM3gGmTleidz
         ZqEPaBOH4UHV+O18qYd4f5RZhx1GvrIz19jcyXMfdL41Om3TaVnmh9FoftM7qsAf5NE6
         KHvGu4zGKQ67zoFMv2F9Jb6PPgvtNCdxn5eohCAV+BxyFnDuWgKqtbtVZ7tG3E72lo6M
         mHATFScu1HK32oFt0Z5w+JTX3xEUmQM/b2rTcvz+j3sZ0ExIhI9aqg664R87odLFSGXj
         g1Rw==
X-Gm-Message-State: AFuF++ksyq+7aU1TOaw2ZOmXE8ZnAtkv3IjQVXjmFouANal+oYTL1eZW
	tHYC2+MBXGPHfKwLlc+ogzn8r/iTYeBs0gv/Gs+Ds5Tw6fLkN+DoE3Kd
X-Gm-Gg: AYBFou0yr9vyzP8+fhh4MUA0+IdMSN2zWL+9xoy/F3eoDewXPAxxY+R4Z70tW7j7Y2m
	aPHF/QuPBUQ6ENKyoq37XQ5KeAWsUXY1WXmT2tAUEgB1WQxqboS3gasoNArF24DOBWXca42Ic1l
	qEgn1x4aKCHloBM3nX+E5PAc1CYVCJPFUsb+UZ6+GFQUntFMOZCX+wgSD8Yv53ygd8y4njt10CF
	/Xtl+1ukixmHRFFIHkY9c9TXGdh5DIkGLczLFOf6zfyS1baCewAhJ8DRiaPBYdi2WuuT4635pca
	KHoZc/QTtYvJvdUaZVN3tzonUvh4vLt/KH4t9qQV4f/5UZscb6i0XjGoqAzFKnh4X8jTCp5ARjM
	szjrEjbYXRWH3WJEeMTyUqKonFtQNpZEQS9VDay2hocCAyE5neGoRn+WCsXUzjnDeQELm39Z3p5
	/qrzSujtvjOfas/xX3vTZ6+Wrkthy4ehyYlP5cMKlmALAT4gmGZXgULNDZmDltdshylXZ7CNs=
X-Received: by 2002:a17:90b:58c8:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-398bab4a682mr15645724a91.2.1788219509209;
        Mon, 31 Aug 2026 16:38:29 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm2143682a91.7.2026.08.31.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:38:28 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Tue, 01 Sep 2026 05:08:11 +0530
Message-Id: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQ6CMAyA4VchO1uzbjDBk+9hPMyt00YFM8giM
 by70xMa4vFv2q9P0VNk6sW2eIpIiXvu2hzlqhDubNsTAfvcQkllZI0aBoYLjf3QtQSekhviFQy
 VjUIVSFde5Mt7pMCPj7o/5D5z3o/j50nC9/S/lxAQTJDW1hvf2FDvTjfL17XrbuLtJTU3zLKhQ
 EJlj0ioHVYOfw09MzQuGzob0mAZHB2tDF/GNE0vFcnxUT4BAAA=
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219500; l=1991;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=rA4QIuFO1naxnZ7iJUUs/gm+e2xWDF9gudgR2Nn64Gk=;
 b=H4FZ2/dn30PCO3uXPEo/aR1of0PBoI48JMMqoDbWkWPQDQBUKVtcpjEkQ/M0rbwDir4sxD+je
 qH6LYUnKY3LAKQd/JIeAiazlV/rSsSrA8xyw/e+W5KjAUYZrf7+m4E3
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- add compatible as required for child node
- Link to v3: https://lore.kernel.org/r/20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com

Changes in v3:
- Rebased to latest mailine 7.3-rc1
- Removed note in patch 2 as dependency is already merged into mainline
  and there are no more warnings.
- Link to v2: https://lore.kernel.org/r/20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com

Changes in v2:
- Fix legacy node names containing underscores in existing .dtsi files.
- Dropped 'minItems: 2' and the conditional block. Made 'simple-mfd' and
  bus properties strictly required, as all in-tree dts uses it. 
- Updated patternProperties to strictly enforce standard node names
- Link to v1: https://lore.kernel.org/r/20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++--
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 106 insertions(+), 35 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

