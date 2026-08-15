Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4279737E5E6
	for <mfd@lists.linux.dev>; Sat, 15 Aug 2026 18:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786820006; cv=none; b=XPnX1gocV4EZ4iKbyJKpwDSOMbapUEh/qZO50gRG6CImf8MmhmFpTpP/B1iSrRZ0A0HPG+jKps1MhCKEohWY91lZ90W3NPtB7iXJ4DMt2XdSVS0UVTbiWnD2u3SSH3iE+Vml1+HmJHur2A+hFZS7fIq1NoGZe+ad15bZt1mW/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786820006; c=relaxed/simple;
	bh=0c/4L0Z1jAiqA034Ce5L4JKC6XAPputkHsDsi5EHESo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p+iwS3gxpiyFQjj6JrfB2PjvSfBAlXx2GSBmm5nctN+thF34hjNkAyfAzXafegFS+V3vDvhkymTLlyAwnJL7aEwzXfui8yW0CXFOh14UPBszJAKJ4b/gHgsvWht64OuMFHZuJo4m3pYuo1WX+R/HZTm1Ika0EPRflI9gGakY6PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYSMOXBk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYSMOXBk"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cffd93cdedso3476005ad.3
        for <mfd@lists.linux.dev>; Sat, 15 Aug 2026 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786820004; x=1787424804; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lO/GAhuRx9Cc4gcz82C8v7OvrP0NnD7lPKYMhoj69UQ=;
        b=EYSMOXBkBBoOSdx6EHKpd1RzaSpD2V8UHvxp6nLEJ/YyuC0Yypg82PM6mVG+rOeD/l
         fLSToT8yiPUZO1KcttahZ7SFlKFytVNT+/BRCA8sSAYkTOv8Y6YPcjgOjb3SSOeT6HLJ
         Je8BJgeFgc9BqibgNuIxQhOtQBBNrv5vU0GV2p8CWEuldQRh6sLgg2AskkKg8FD3hgRn
         bgQdB+xZ0jo4z8ViDKd1oo7QCOD4YvEGumVaxK5e0RLl5HtPyFPIxgoqpqfU9vh5NOSv
         BlftgorK9XakbQNmbn2VwcuknChopFfCklqLsSeLvsl5xUpat4FLzPGhixQrp/d7JLH3
         mbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786820004; x=1787424804;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lO/GAhuRx9Cc4gcz82C8v7OvrP0NnD7lPKYMhoj69UQ=;
        b=Z4SRO92c3YaggPXTIQP4NWdurtxQbVGPyMifbLT/pjocWJtSOerhlIlQ/tUfZdpMIV
         p+arebptzpI7DZwAYb/2DkYKP/ZsITyafvoxIfJWDPKMLFusha4rNbyGDIiHuSxJl+K2
         H+BV+EdCS4/UN8MAvwI29XOrfbmRsMrwj8s8FeId6HAU2xOJBbQmpxlBDzccDCzTxAk0
         +t8IxvInnhwQbZ0NgHqcd3r0pNBJqTKw616OpnAV69RfAgdQwRRzrcExO3YuSpKvDBlN
         neXqwWvwgot5G0oMG/80eHKsF0JoWaerDqFFqNODruoKHgIe6QT58VgFFd+4LiVtN5Rn
         xiCg==
X-Gm-Message-State: AOJu0YyoOoHQ7pUPaALyX+1axKFcIW3vykUFZAnvakB2+9+xEsnfWRUN
	aK5DrvT6VSX4nVst52CiSyaFWJWaVXrTE9ta44gjbkWnG9miODlwi6MF
X-Gm-Gg: AR+sD10PoOqqEOed2/IT9HlwTAUP4iRSA1Au3/rpw+YbqLnX2lUA9mcmCPnkML6Foop
	/nKNYVY54iD7qO99TLr4gU3tEYCaygIFXxkuncXINRWeNrS7bEKh4g8HvHkBYnAZDiZYj7dXG6e
	sDyWr1K3fHZWaIqusLYVG/dW6sPoIjDRS50CnjXKqYikARLgo7rXNMgx9RhElv57n0R9lPOBgs/
	ZASqqkPFO97sPN8SWmVQYZGDmgDcdLw3Hi7x0L6wbNDmUhfPXh9+cK//FlwgVTTtvcDc1/E0CJQ
	nptNsd0fiRLpJR7k3dsWzx23I7MLHNEocDEgiJl1HTm+Tbbrc1/ri5LkuBJ1YB9WBGLOTvM0S3L
	QxhwOSkMAd4vC7Vk86p9NhV4oiZQV9HMP2cYhBS/hVwkxuo5W+Fec0UL3WfRMC/wP4bzbMDOi6z
	o1a6iRF34/s76kKcKpgCKLZDyWO6xCEGIb70Ibs3QFj1431W2UhYc26RqH/xTo8pS5/5Kjq1LN
X-Received: by 2002:a17:90b:448c:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-3933b4f801dmr10888735a91.0.1786820004479;
        Sat, 15 Aug 2026 11:53:24 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e5cdfsm19289125eec.12.2026.08.15.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 11:53:23 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Sun, 16 Aug 2026 00:22:58 +0530
Message-Id: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQ7CIBCFr9LM2jFAFVtX3sN0QWBoJ/bHACE2T
 e8u9gAuv5f3vrdBpMAU4V5tEChz5GUuoE4V2MHMPSG7wqCE0qKRNSbGF60xLTOho2xTGFHTpVV
 SeaqvDsryHcjz57A+u8IDl35Yj5Msf+l/X5YoUXthTHNzrfHNo58Mj2e7TNDt+/4FBDY0ILYAA
 AA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786819992; l=1571;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=0c/4L0Z1jAiqA034Ce5L4JKC6XAPputkHsDsi5EHESo=;
 b=Xo7ghDZ+X1o+TnmeQEkuJZN6NrHvhgHnyur8at9eZMwocYxHxuO7WdyBo/0kHttqh2kI5sB9B
 wNTP2VQC5xaD1B1e9GKqh8f+zHrc8argj11FZAjtRZ/76JO2F8Q/JAX
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
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

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +--
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 100 insertions(+), 35 deletions(-)
---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

