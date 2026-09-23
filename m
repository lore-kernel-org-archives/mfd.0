Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A43B392831
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 22:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201045; cv=none; b=ktBlja3aed4ZqAd97UJNl8KH/Ay4fHTEMQCu1MBZATJBdG+qEdSyRNJzDqgRhjoQKzydVw8kT529M3eqqNJE67sFskQKPj0dWTYkj7pOCz7f3mjjYFNGzaX9T47QEcAPnmFcMh8XeuNXMNpOTsaL+iLLVU9ftN1NmY+TP5sxolA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201045; c=relaxed/simple;
	bh=XYWu9x6hbf4E5RXhwpVrlV5tcStGDII4x4irJ8rJ/EE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bTJI2jYQNjWLDfiMctll8VYm+27zSPSNFWg9xq2wcO6Gd0YhBrvwaq++xayq6EnN9VPXJJM2IY8HyZp1HhdG7gCP1vpe+AD0ZT7n4z5DjICUta+FSkDP3jzqaRRFf3sv+r3ZPXs3h4Jk49TrliARnizuxSjdZ5hnLwC+W2RqEUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx1SGc1X; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx1SGc1X"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e61b947d0so138000eec.2
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201042; x=1790805842; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fh/HcB1NxrAKhTVrmSl2V1/xU2WUlyCi2XiJkw/1lm4=;
        b=Lx1SGc1XycJKV3GVgO9Xrk1eQmyhKMcXv00I76CZ90Xv2Yd7S87c/2PXtNcLgyFr4H
         WR1uBxhifPCxJwCSBu/S4ka4pXMTBjYtlecr1qrEHUMUN8INdaeebQAKBlN60y5Nu7qh
         2ASrLdpLQ7xHGzfGJUCGjNPRd76AItl17CcIiN4ZPCUHTi6eLGBXMpACxQsPtGka/3GT
         fSPNja44o2YpCHHAU9fXRpktyoa8eq51g9Lgz6WEfSOvtnaSJpMR7z9+hS3Ll8tpTDb8
         h6O1DnyQtuMogG0Tt7JCyO+VdD1lZeBZjTlY/k3+nvH0Ut9Py8g4Dgx2vnLt+1TiW3dv
         bxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201042; x=1790805842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fh/HcB1NxrAKhTVrmSl2V1/xU2WUlyCi2XiJkw/1lm4=;
        b=ScXVBoBMKLtJgxwF9TkNrArhhXeU65YdUti6q2J8l5mEjVhj0n+9D+laB7Lf5a38P9
         IH0248A/o6RhLGWYjnYCQ1ofKWgsPIuZYhNEcI4g7SXC3o19/sXP4Eithjiq+rZ5kdgj
         s2G60Wi8nHkWB6qUKufscdvuivN9JLa0y0YLtLqtYwstRAtvIUdMCnQ9I6w1nvKRa0lL
         pfrjKjaLxOXWAiIqzWMjtpGGtnSVl5yqs2+j4oTHM8PM8nsZ37zJWnPme1medIHV4s7U
         ClBPOeRB+FJ7nqNoW5ibgt01S+hpya757NuLc2pLO3XxDFQjOe6LhSvJMWUVfw0HWIyN
         8BBw==
X-Forwarded-Encrypted: i=1; AKwUvBz5/rkruz1h4I+nk4bZ2zdaR/47tVIAvPDk8UreOTs9leWlIE8KEpoGFtsMMqJ9KHEBdkg=@lists.linux.dev
X-Gm-Message-State: AFuF++kMFSateEXjDO1muZ0RaEi4oysyZbeGhUaKLgnTmlvSTvqQBbvg
	6P6ON3upXt41QEWLmw8w93gjxzzyd3ozvwufwZPlPbxqh1Olr+/R+GTb
X-Gm-Gg: AYBFou0txhn+enkUEU8FIhBz21HlqLj3sTGP03/w0YucnxJt6u3HnW3bxDyoQEnn8Gc
	2PV6zP2NB7eu5X8eTjACNCmeC8BY8Z/75nXuDGwflkCv+6NgkX8MZuDdvqLcTnVvWuEh+gWlcYQ
	wk1vxZ7HrqJ588BCVcghV4BjqsSluFJbACFmkNkpdkPT8nq0+ShBa1PGg4a3Xj7LrQVzYtYvlce
	5K4rZPrWilAz0zfpPjpLdhbLVxypDDmW0/OPHx1XN+FK93ziLPcwhWDYx8rm2nOQRgxE+yv/jU9
	Q4TrRpXoHboLtDYNg1YiGo9DWJin5j4nlxSFfLzGck9OU4ytv61ZEqeWykT6hSMUTXpkZo96ezm
	1L8XwRsoCwMfBfMMQs+hOQXMLzd04KkOdVepTBbZgWKaeme7gHq+hLD2agkiqtB53p6lzAegZ6J
	UFMo1B0LNasZS/F2FdpjVmGItstxsIGSBlhUbtk7FM+INZqq5bp/J3wDUnUX+79gcuhtfzU8D4J
	zTJJuo=
X-Received: by 2002:a05:7301:c017:b0:33b:e1f2:fa0d with SMTP id 5a478bee46e88-340032c70f4mr570866eec.2.1790201041985;
        Wed, 23 Sep 2026 15:04:01 -0700 (PDT)
Received: from [10.197.48.252] ([2409:40c2:5047:8a3f:9ef:734:1515:aac8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm7962458eec.8.2026.09.23.15.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:04:01 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Thu, 24 Sep 2026 03:33:29 +0530
Message-Id: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13NTQ6CMBCG4auQrq1hpqWAK+9hXNA/qFEgFBsM4
 e4Cxgguv2Sed0biTeeMJ6doJJ0Jzrumngc/RERVRV0a6vS8CcYo4gyB9o72rRdJJgYqE25SAMg
 hVWQWbWesG9ba5frZ/ilvRvVLYrmonO+b7rW+C7Dcfcu4KwegQHOmJBeSocT0XD4Kdz+q5kGWc
 sCfzUHsLdKYWkBltZWcC/Vv2dbme8tmK5jWyGPLRca3dpqmN8jpxUgwAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790201024; l=1889;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=XYWu9x6hbf4E5RXhwpVrlV5tcStGDII4x4irJ8rJ/EE=;
 b=EKEgcgmUWan6pVhjGd6mHholRHJ1cdAWwsrhcztq4uuwyQmAoTn2FJwVEw5A6qJg/uyHilqap
 ptwgibKv3dLA8L/kGcrhqZ5z892dPq4Hc7FN21w999t/w1Mq38LpS/b
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
Changes in v4:
- Dropped applied patches 1 and 4
- Rebased to broonie-regulator/for-7.4 to resolve conflicts
- Link to v3: https://lore.kernel.org/r/20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com

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
Bhargav Joshi (2):
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++-
 .../regulator/maxim,max77620-regulator.yaml        |  5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 -------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 74 ++++++++++++++++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 5 files changed, 88 insertions(+), 69 deletions(-)
---
base-commit: 05a3330f490cfa266831c0fc7f8c6df942866d59
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

