Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998684F4723
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564409; cv=none; b=XqEWuH2B+37Lq+tuNC4R36PNU2g1kR8I9eouP0v7uKsJ6HuU0jDdVJCKKFe6uqNhZsl7fDH+CRpjehImtjdMdWGpxER5Vh4sozwczBtof9tCKvcBwrtTm+XJalGGnqp4Jn/AEblfvBVn8CJQrX/YUYg3b7SRS2KxAiIkLJlFSTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564409; c=relaxed/simple;
	bh=aHPHyLZqMZcJhOAzQJstjzYjyL4IWgz2sZBsyH3+fu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2e6CVf18Tsp6XdjQ3+j2CIQJzmAKbDbAjMoIV7Rot6L8zr3B7onN9dOOeSrRGi0uIpQPrdifkQ986jibJ7cLZeReJNd2aX8MCzXcKS8oApA11+aYagNVg5pBZHNzrNVm7lfc1A4x6N/MZoVr0MP9JBQY4s2CGBanvNodZWjY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LExAa/XH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LExAa/XH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so66452a91.1
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564407; x=1790169207; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzUOoJ26Q4wpXLMeAMsRdvt/sheLzu215cuCrI0jbd0=;
        b=LExAa/XHjct1qxzGRuaZ8Y9LpxrdGdmd6SQGb9rSaJnSj/xXYO7gl+J0EGP4DyRuJv
         /M0TOMUqbOpeV2DT8MWert4IPYqKdeAaCvLBv5ZPbSKg+w4dj147hZxx8EdTE4pItzDV
         R6JSdpC8ZG00QuknMbiyqtewUx2HNyRIdV0rtxyEg3vh8JHOjNZQByn/zYFsaRPkG2RM
         AnB/PFEiNQunuGl4YCoHTEWJB8Y+gOiKtksQVYgdH0YHfcx8jtE76ahOtWWylBzVILZB
         Qot2NbBW+6x+m498AuiB19wvjwycY4Y6u0gVunsGE15y7LY6g39Na4aY9zjBOirxdi0N
         4n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564407; x=1790169207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzUOoJ26Q4wpXLMeAMsRdvt/sheLzu215cuCrI0jbd0=;
        b=zm5Rjzo7C/E4rIecMBmd8O4xas+U85fIVFaifQS57KK5cPHh72JaPpd8DcKyqM9WGc
         r72kxh/ftwHsYl4ciUtCtGhc/OEDRRfIt6R9vksbjd+Kppaj/pGJMsfvItIBVKAbAsCh
         jugDszc4P4uefq4Wectk0fwKEFj1/weM15LiFlqgvGa4zPjbv+456DDTGqdvsIb2y5zh
         v9pOZia8WKlmU3vipXAQy691znNQky+Lf/LwklXBAkFocIhTW/kbXofaZN2fJ96J+IL6
         aSI+jGIMzwhlZBPGyCnQxb/XYr8AGUTXKSld3tTkmLDmAB3cxRCA7tAjKmUfXIAvfdWz
         m/fg==
X-Forwarded-Encrypted: i=1; AKwUvBwvdWTPY4XXz04OZXvZcNIK3+h6n6otvRoVdN0N242srfXdaqNwNT+HZva6sutqC00xhW4=@lists.linux.dev
X-Gm-Message-State: AFuF++knWOL+7jnA9GsxIn3fvWzJ8MB77xpUw3deUHEudZoDwKo1V+YM
	pMpaYANqxMCDFbncsf7MIzv/vHlHHCoIHeBUo9x0L3dKi+Ojgnklq7ua
X-Gm-Gg: AYBFou3TP4YUBrVzDQhqBQrLE93FxaMz8mCnWP0Ytx9TdFfgSgK6B+Wj6ENf2UOFJNa
	PUtf6BcmisrA2F0iOttTwlk2QbfAxLrL+lKeNBPdFaVUoZ4clivKU04VMkLBxtzR58sQtCzfRgE
	7h6FaVde0NET54Eh8UjXpeW7pI9A547iyIzQQqTuvJUjzN2YarOT07xj3NrCtBflXvt8v2pwkt3
	fxSidLmTbahRkKQ+wSatTdzjeHcgeCKy4fk9+Ek5gOXDF9MMsm7w0Ti1CEcf2kBXPGpGI+ahqdu
	UBGuSmoGZyE8sTX6Wk6fwDX2sBw+vYYkCBWzY9/ZcMEhR1Xb4r8Km7EYlvhYe5plQlKIcJRHN9J
	VvCOU1Hh+oK44dzBb9HBReLmlKs+LRvA6K4yezAcA5hFW+O/jghCqIStWLGhT7yz7vUnzrJ6MPl
	Il7mV8KffaoHa5jadHxNG/5PF+vTnPHIBGVCjNtpDe3ZFiS781zMJwseyiAfeObeXfir21NPBPp
	VUdzPnPtDw=
X-Received: by 2002:a17:90b:4b88:b0:39e:24fa:eb0 with SMTP id 98e67ed59e1d1-39e24fa1fdemr2789608a91.2.1789564406661;
        Wed, 16 Sep 2026 06:13:26 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:13:26 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:27 +0530
Subject: [PATCH v2 2/4] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-2-f12cfdfb446c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=6082;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=aHPHyLZqMZcJhOAzQJstjzYjyL4IWgz2sZBsyH3+fu0=;
 b=Zyn9uuqtMLE6P6V/CbvuW8eCHKeuxp+3aE/AhaNrteVq2K3hGIsuOnJHvAezB0hEfVWZL5/8a
 oMfrd1j9AAOCwNTYfFd4qGnIlYgOZMf7onSipoYbow5/MWA8F824x3c
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
Set additionalProperties true as this is shared schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 ------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 76 ++++++++++++++++++++++
 2 files changed, 76 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
deleted file mode 100644
index 4bf2dbf7c6cc..000000000000
--- a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-NVIDIA Tegra Regulators Coupling
-================================
-
-NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators.
-Thus on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30
-there are 2.
-
-Tegra20 voltage coupling
-------------------------
-
-On Tegra20 SoC's there are 3 coupled regulators: CORE, RTC and CPU.
-The CORE and RTC voltages shall be in a range of 170mV from each other
-and they both shall be higher than the CPU voltage by at least 120mV.
-
-Tegra30 voltage coupling
-------------------------
-
-On Tegra30 SoC's there are 2 coupled regulators: CORE and CPU. The CORE
-and CPU voltages shall be in a range of 300mV from each other and CORE
-voltage shall be higher than the CPU by N mV, where N depends on the CPU
-voltage.
-
-Required properties:
-- nvidia,tegra-core-regulator: Boolean property that designates regulator
-  as the "Core domain" voltage regulator.
-- nvidia,tegra-rtc-regulator: Boolean property that designates regulator
-  as the "RTC domain" voltage regulator.
-- nvidia,tegra-cpu-regulator: Boolean property that designates regulator
-  as the "CPU domain" voltage regulator.
-
-Example:
-
-	pmic {
-		regulators {
-			core_vdd_reg: core {
-				regulator-name = "vdd_core";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
-				regulator-coupled-max-spread = <170000 550000>;
-
-				nvidia,tegra-core-regulator;
-			};
-
-			rtc_vdd_reg: rtc {
-				regulator-name = "vdd_rtc";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
-				regulator-coupled-max-spread = <170000 550000>;
-
-				nvidia,tegra-rtc-regulator;
-			};
-
-			cpu_vdd_reg: cpu {
-				regulator-name = "vdd_cpu";
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <1125000>;
-				regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
-				regulator-coupled-max-spread = <550000 550000>;
-
-				nvidia,tegra-cpu-regulator;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
new file mode 100644
index 000000000000..248cc98b6af1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Regulators Coupling
+
+description:
+  NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators. Thus
+  on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30 there are 2.
+
+  Tegra20 voltage coupling On Tegra20 SoC's - there are 3 coupled
+  regulators:CORE, RTC and CPU. The CORE and RTC voltages shall be in a range
+  of 170mV from each other and they both shall be higher than the CPU voltage
+  by at least 120mV.
+
+  Tegra30 voltage coupling On Tegra30 SoC's - there are 2 coupled
+  regulators:CORE and CPU. The CORE and CPU voltages shall be in a range of
+  300mV from each other and CORE voltage shall be higher than the CPU by N mV,
+  where N depends on the CPU voltage.
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Thierry Reding <treding@nvidia.com>
+
+properties:
+  nvidia,tegra-core-regulator:
+    description: designates regulator as the "Core domain" voltage regulator.
+    type: boolean
+
+  nvidia,tegra-rtc-regulator:
+    description: designates regulator as the "RTC domain" voltage regulator.
+    type: boolean
+
+  nvidia,tegra-cpu-regulator:
+    description: designates regulator as the "CPU domain" voltage regulator.
+    type: boolean
+
+additionalProperties: true
+
+examples:
+  - |
+    pmic {
+        regulators {
+            core_vdd_reg: core {
+                regulator-name = "vdd_core";
+                regulator-min-microvolt = <950000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
+                regulator-coupled-max-spread = <170000 550000>;
+
+                nvidia,tegra-core-regulator;
+            };
+
+            rtc_vdd_reg: rtc {
+                regulator-name = "vdd_rtc";
+                regulator-min-microvolt = <950000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
+                regulator-coupled-max-spread = <170000 550000>;
+
+                nvidia,tegra-rtc-regulator;
+           };
+
+           cpu_vdd_reg: cpu {
+                regulator-name = "vdd_cpu";
+                regulator-min-microvolt = <750000>;
+                regulator-max-microvolt = <1125000>;
+                regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
+                regulator-coupled-max-spread = <550000 550000>;
+
+                nvidia,tegra-cpu-regulator;
+            };
+        };
+    };

-- 
2.55.0

