Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908458;
	b=tq+MV1nQ7fGiKuavqiKiwv5ikYb+6KyFQYHQs8BtGz3HWwrS81rv5b75sYeRGmEV1Wvo
	 U3abuE0wIjYbXMAXWVjtK+qy8NUMlxQaNkIo1eU5g8IAqfGiKsGBhLKifTcfWSnF+gfyM
	 DONfF8TrwqbK4v0qruVnCjksdDphz25ycUpL6y66uHG8XA0uM+4ResQnp+bve4xcX7+f0
	 XMUZm8RXAmt8L/hjzXS4xqtmxZSNgK7zEfa+ut3Z8p8N7d56KXddNFGsn6MAv/XKAbeGk
	 QvYRO4TAx0VXlCJMKFdgV5PAjPoa8agf2Qb3GbS0oUvNNNolYgilMcksUwhDcXMnhmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
	b=y125vuKmEw6+Bw1cb7NOx7LjTzKpD56bm3rHi2EYgsEBvckWvKO4Qc5ZvkKu+YO8o2Wn
	 1nJOge6bwClXUg4IKJ+95xICIW9V1TKmdFoiLKXqGXhtgZD0+ZvEGK9ZFovo1SGUMP+Z8
	 dZB5BAsGHbA9jG6VRYzYltwZttaSMmW9+ufe0vkYz93qouvmn7yJAZx+E1/5Co48htps1
	 XWafQVqzyWG5AyyID4V4jA3aF16U5cGxSN5BydNfmDkHIR87jqWF443gwKJ7oeBy4jQfN
	 Qc+1G1TMK065u1nWhF2gGodgTLTzrIGZR6pULeHxhvxzArgZ5hMzscTMYdChR7h5QEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Or+oKa5y;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9B2606B9ED
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 19:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9B2606B9ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Or+oKa5y
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so27487255e9.3
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908455; x=1794513255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=Or+oKa5ygV+HinpQgIq7QtFLXLjv2BCC90VG7vJUuLK58y9vQ5QidCfOnOkGTyaJeR
         c/bou8bYgyMryPO5PbSEv/ToZcygPGNpZfrFQv+R8OMDhYrdK3vJOXSvmr2dDP2jiwd8
         9mM20OGyxR7bD71/eWgIGpYkFDeqDLQa3HyzWEwHHm1/wljSHNir9CCJmTbakTRnoTYM
         VgdbM+06vuBJnxBkthY89QK1JqYirZxnMTD32YVLhqur+7mfaAIGm1wHdFIgA+It6Fv2
         n4z/pRIt/ay1dpDQ4yTP+ruexiH7cXF46G+Q93qk29i52YrO4QwyNcm++4b7MCDHB5Gt
         5r2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908455; x=1794513255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=P2QCgvMrPZlnW+SHsRy1gVRbA40VgozuGsR0sXx0pkUF3fp47MO/djgHYu9+jT4/Xc
         t/dT5e5pec/3+AlUxvqfh+Wectg/Ebd58hemCFVZHW72huKVSs/JUq/fqa2V8NeXU1lO
         7Mx8nSVWFMXOdKUuPoy7NdfGF8pXGaEHBF4pEwhHDqju2YtszY2zRXdo+6fdDmPgSa8L
         kZObm5WKc4VKulxUokb3VfeCo8a2312+rDDerP2rsiOgqh72CX83I5zSC1PfgwYB/0C9
         wZGWnNUMOtClZEJX2kGXexZNcJ8TftlssoXiaBEZ5OV2n77JhcTQuCoqHr2N5i1tGQa2
         qv/g==
X-Forwarded-Encrypted: i=1; AKwUvByZf4T4EzAglrSSt6tfGMvxq8LYSnu57HqxkQBorwKzE5kiVPVGeqFKn7IdZgWvNybudRA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+7pEnBGSxBYo8PhfmaDLeMCC1BXw8OhmJxgIMUz0xADQkTA6vo
	BSRy0ue/veraj6b3PVrELrfJ2Wh+hb61JJVrrsGJIAwuTS0w9s1K2Uxv
X-Gm-Gg: AYBFou2ti/vKAllrpZYF1lbChmc/kvg3KPI7YOf2vVIbFEMkLrvIoC3cQeIn4iid5dV
	wLUmJ6W8hPYPeyx8U3ZG8r50DUowvYQ0++LymrzM2uEBbxjXkhe0kcG/rQnH8m4Wha4dCbkMiD/
	kURgbiikkVFWE6NxJ37Sn0nw37Fh1V/XbGKYTTZmDYoteO156drmC50rwG/VAsXyJcsalH2WGAX
	s8z1NrhYCcfa3QcZwAUTVeFo10J1PQvsaX57zzvb/Q2P7FcHlsxfkVXsEI6yOX+n00kOkERAE1W
	1oVr34lnIjX64oAUo02SwGVUw1w+WD0pAwNf0wOFt8RilAkHbrqLuHH3WhF1IB2SvMThHZx+Ct9
	OOQzFdAs/g1Qj560tCxDbPoQWI69jE6EZQf2Psz2NrFN7wxn/BigscDwqtHOhsSK08LKTwaVmGT
	JGt6yH/bJ+dPLCwPQAwptLUTqkJaO7ulHYy17EzQ8Q/JGXgur06ncVkjrdJxG02RwUSx9qNNhSS
	EYJ9S4+/cqfIT5gfEmDlBe9P4knEempOMDtQbyatgznto2otf3prWdoHZV7ly7IaY7hlGuIAB5P
	N5Ankql7o/pa/GEeBDT5Hd5x2u0WZCLBVTJwHYcOKY532g==
X-Received: by 2002:a05:600c:3f10:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4b6dea69280mr3035835e9.14.1793908455226;
        Thu, 05 Nov 2026 11:54:15 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:14 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 3/8] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Thu,  5 Nov 2026 20:50:23 +0100
Message-ID: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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

