Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CCB35FF58
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187566; cv=none; b=AbSRrYPO0n77tv/L0W1HS4JAytZq8ewYJe30fkZTULcI2NtwihuU3y/msf7h+eE8Y6Wfgl+6xdOHWuOJDIw+hL5o3jPE9hFpLjkuPfD+WbRGsMHjJBZx/KX7aqdovDy0Lq0fWGJmtCRoYfMY7tovk/x2dhhgtu5h5PkqI0T0fwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187566; c=relaxed/simple;
	bh=A5txglQ4iZT/juDqzcBtdepUMip1daW3tLa4YrE6PeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZPLlMOCnTn3HwJI3ACfD8tqDEfxLBYYqDnJsMC5dRrkKlAN6jc2BuhJfe+kU9qC8TW9R9WA+4HrZHNcQo/PSztcbQEn37lCqDhKCFf8yzBBbTa1MyWjaSmWjX89FNDI+lQibr4en4MI9qECftjXGHz+xws9fyZLu1DmLWyap0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+TqnAlU; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+TqnAlU"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbe4592c193so685931a12.3
        for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187564; x=1788792364; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=;
        b=V+TqnAlUZJ8XiaJ5wmRM+W1TGG5y3JK1Za7rjQyg9u6Thliq7hFwlayY7jTcAeUNOS
         6U6ORRcMCvIAXL3haZzqina1JBspkzUG8T658HzuOZ+1abOjVv9K7pW81UTiMLax0t6s
         aFQFVZAm2c9lkl5mewgNbCWnuRt4tpZ9sNTADrIqwI740iOq0tw7W/LfliDOPcVmNVjr
         qdT22CUkhxsQNQ3oZeeKgiPnLKT+5NhZYAfIhFJQYPSk5IQxMgjgNHZcGPqETHSSD31z
         kfQMtnQHFuRo0SNx6A5uA84Q5x1c/qrI0D0h9u4o9BnE7z+gSeHNDDClBt1y+LiPhJpJ
         +FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187565; x=1788792365;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=;
        b=JQPjtucpxATtfq+779up5rB+JFbkP81UeXy1CY2d1F7IGbz23W677o5XGSOe+OYuRl
         8u9MnoRkM+V9oM0qpU8nWzc+uFwDJdb2wC9ViHb2OjB2UpDyuqnNecbzIqpRv7riVzby
         k6a5chncpLy2OSDqQDy7hDf9SR3gY/BjcmArw1QJetEss73Yofe5KVRMOVZrOIegzQCc
         OHyUvz1AS8//fRSMS6h7ZMs95uL2SCyHGvVaTlQBeH2Gbf+hNfeSTOtCsXQM5MzAbIZS
         P8Z+7hMv9ha4/fQjI1nwvzebJe04nWUvE/hZ7axQXXkKmub84DkR5GT20wZuYX4hO4oa
         O2pw==
X-Gm-Message-State: AFuF++l/SduU9QMP0awExaBS/xrhYsFL7+xvME2CGHBmbRfA6OIUtUE+
	3Wsox1CPtjqMY55nEpX5wA7mqtOU7LTO0OXf6HxvEPaKPkqNa08CTXwK
X-Gm-Gg: AYBFou2HoUoNOmU7qEftryOZg4U+ruMyHnhPA5z15jyzeAZSr9MMuiT5NH5/wCtl0Dy
	zsx6sxZueUTP/Q4KEUZnoUk/jWBEkuSMShtFPK1v8Y/PWUWHiKowWovQgBh9mD2oUzkKCDkonQ+
	nrrhQMb144ksHl1ftdBoArUteAwEfaE+D0fQJIcL8YA5NLTdqcg2vJ065f06Nlo1ebzPEEPKltg
	fykBhN3nHoo9K1GBj478B2Okg8LTGBfVANG40rs5hbaE+PDxfkIXVssIippuP+Bh1dm7BRTu7Vj
	j/+KsqbnjQ7IBJ357PliGpOQ93GM88zq5qDtrvbaplwdXaMhenyZCZMM3nDshD5uNqQ8OCWfjAc
	GYJxfYhoU+IAWiVvASQkQ6n15YWkO0OVzPe9A4PvHZxo+AtMyiE0WvCg3XTmDRaGuRFRBSsVTDl
	/6LSVxULpEdFQzTdmeD+AYv0r3DCxBa5F1JgsQrFSzDXTWJPwcERQkxTJEgXB0l9cJ5C4qCHw=
X-Received: by 2002:a17:90b:17c3:b0:398:bada:832b with SMTP id 98e67ed59e1d1-398bada8463mr13042007a91.6.1788187564330;
        Mon, 31 Aug 2026 07:46:04 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Mon, 31 Aug 2026 20:15:33 +0530
Message-Id: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ7CIAzA8VcxnK2h4HDz5HsYDwhlI+7DwEJcl
 r27bKcdjMd/0/46s0jBU2TXw8wCJR/90OeQxwMzje5rAm9zM8GF4iVKGD28aIrj0BNYSmYMLSg
 6VwKFI1lYli/fgZz/bOr9kbvxeT9M25OE6/S/lxAQlONalxdbaVfe6k779mSGjq1eEntD/TYEc
 Cj0EwmlwcLg3liW5QssVIWW+gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=1832;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=A5txglQ4iZT/juDqzcBtdepUMip1daW3tLa4YrE6PeI=;
 b=5uAF3LTjxwbIRorl7/hnCp7yFyq96RIEgs7RuXrtj+raAjTecfJX+WAM7jZuoYQBJFYRLlgxl
 N1rT/BPZrX/DPWg29wTgWzLZjONyX8XsbRKmfhqszWfkPSXbw+mVYO/
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
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

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +--
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 100 insertions(+), 35 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

