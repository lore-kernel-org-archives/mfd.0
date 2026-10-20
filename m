Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517834;
	b=K++Q/UmW3kOI7yOkKpesRK9P0dMv8V4ODPqKLEprcIx33iTHjszPlvt/c5twcyLRezU7
	 NXQfxuI2P9HuI/lnCjpR9NtTtMsadh4vQ/d6ZSC+MSGOTFl2gmRMAX3Cwc4udyBAhyb0W
	 NtUy1r2bEkEPZP4ZcUuRr6P4PhDzxR+tZ/jWOvvIlc5XYtk4k8c5VAfU7O24ADvk2XYS1
	 T4iLq3IUchvnz8PNFdQjI7WNkYrR0qJ29JCCFCHGAyBBmOuzdhYa6lxoEhrY4zrkZN7mL
	 t0byaFrBvW7Mk577AgHTydFQb60rIv2t11ZWdCb6mjjMeuQ6OcIw+bN2+IDerPxkMLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
	b=XqilyhPxACfBM5Hni4uHp0FLO3qo0Mp8FT4yjWH8RXmzsx5vBkagxkX1vctGMLpFLpxT
	 /PQpEWYvVe1ar92q0qtVwvYAbjxUPwM3G9y33gLSyTqfCRdXg5gZWqauT4q1ZwQsk8EZW
	 EasC0agy9vLqnalyfS2ey9mrntJB9/lVUN37gSvlvsYYSBrSpraRgyHxZyHNhLwC/9evz
	 yY4lJ1txoq+3w4jqDSkBrgdHkqJJs2mqb4/oKlX0qRwTwqxcei1Yss+48EHeksIv4Sf+u
	 xeFj9tMFclzsgwTcZiFhoAjfW32NKlA2uBjj9uudsccsvi2wLXdVLWiUoTiBSwP2E2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rVcyyCce;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E68660A2622
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E68660A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rVcyyCce
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24765995e9.2
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517833; x=1793122633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=rVcyyCceKqB161TJu2aVOjjX+na1ELU9I55SfM5Q1xDPi2KoNOAp29xdCCA/UpPuBA
         DCt2z8NWaqyd40ENQRSEZVrAC8U/ShWBuTjzmgSs71e/6+u94TvmMiu88nmc3tKslhRv
         lFndjFZqyzHu/7AA2FdaK+Ug6Zo4JGoXp711hY6vtSveSffZHStYEz0ud0/r9nZdhSo4
         ITGHRvyc9LELxDH9BYjyvJd2K9xMGsggX1DJiN30iROd1lSmvjeC5AkBgZU6+TnFrkAF
         XuOOxlFQIqDWxXPIfvzQzHfkmUZ1sBfTgIQekh7gsakFnLTH/9wVN4BoxXl1VtqjhruK
         Susg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517833; x=1793122633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=z+fCTyF7t3oJqmNCbWqLuVo6lZkfgUXrWo67DGD5TwL4jZ4OFhcLex01/Y7gx2I6qh
         KFOCp/Wf+OrN3A+PDfRDkasxjuhXMDXlYPS+6deDbACUixYv1aJHygQ95AMPb+QA5YBB
         5oYL4JvxtiogjP8MlXPI4ERn3+lwptZeDZFJ73RbZoyQj4lY0hhz4miDJWceQ/wjqOn4
         Zx33lOgd2vgBTIq+axYTwGfZ3s+QBmrLe0dhvTVXAe1orlEUSJN+Nznzgy58/lhOeudk
         LNhIyCert8e5A0ZrLMwSrIWoUnzNnDPvdJfxgamdbesykcjWfazFW2S8OhnQhveIfkxF
         T01g==
X-Forwarded-Encrypted: i=1; AKwUvBxqHTMUlLD9Tf0T6L3MUR+bK3nwW+AJC7xsxUp80v9gskSicEXZssVlrAq+XGU5fwkM08k=@lists.linux.dev
X-Gm-Message-State: AFq9FYLjyfg7RP71iRrOVgynOaRHyuL8UNZ+mFKl75W3UhEIRd/AWTHg
	BqdH1KVUqVR/CK4O10qE5vh6TD4NjJO836Lyhya40L3CdeQBcnCpJdO7
X-Gm-Gg: AYBFou2xVXfAld+1pR9K9hRMLYcVyGKv0HJt8XMXRtWNeKBe3eTTVAdzHC9gNGrXl8q
	9/WL5bNM2aDy1fT1gRypqT8k56APY8zz//pabCkUOuOs/OESz7+3PBabEhxbWn2wSlyNq+PakkJ
	qKckvpcSfkbxxHZleUjT1zJb4u4eJlaHeKF1Wi4yU1mDd5r6mpQL6F8AMLP1XN2cUTNzkPbYBZA
	3azTH5SzJAA2hSxOUG5M9vZaWSnTYq4bGVM1X9E7L55jr7qbjPuZYJPXj8sqFUU1oz3ol7H+zPU
	ZcLZolNNwKCOAgu0G2uYREiaYFGmNjJcjmAfoqZX1EX9gk3z/Q4fzI4sQwlEudheo4i5oqawMBz
	4O29Ho/b5r28sOR7UBwOrg3fG9GL0PZbU9/4zC38ucNlzeeoVSWruLz0B+j+zHHp8qpnMqLGnYL
	kMntOe8zWMXO0DrsuLUe35lVIpAILfD8CEOEem/JyuV94x/hxoOivqDsCmbGJt6mVsRw==
X-Received: by 2002:a05:600c:3d8f:b0:4a1:e31f:e86b with SMTP id 5b1f17b1804b1-4a1e31ff798mr182062865e9.28.1792517832525;
        Tue, 20 Oct 2026 10:37:12 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:37:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Tue, 20 Oct 2026 19:33:24 +0200
Message-ID: <20261020173556.632798-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..d74721d8f2ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description:
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          BUCK regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          BUCK regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 1]
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+  "^v(cama|dig18|rtc)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes: false
+      regulator-initial-mode: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..2e1f41e0ebfe
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_LP		2
+
+#endif
-- 
2.43.0

