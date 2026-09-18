Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED43525A67
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765343; cv=none; b=iNR6pLqIHovfahZB6/jH7xokmkrKzpB5q37Tk5zLiSRqzMhOgHu0DarBkA0bZwKw2ZAWHj7OxLDjRAJJQKd/TjOWTxpTO4ItxPg8lV8u+793anJ+Q35ga0RkbfzHo1Qd+N2/La2IZB0FcB2COPZ9/evPMuDWbh68X6jpeIgmQPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765343; c=relaxed/simple;
	bh=5NRTfbaTrkCr5LOdsA5VA+Gzr3i5fzEHKnaeh5azfmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g+dIZnKNPtxYwSSC7SQ8dUATpoR0PCii9dnlt84oHmKEPcl39kjRS48F/aoHKJvioqYVPyeADC9YITB+HJuprbgVVReYE5RAEUl3/yg0sEYj9Lum479z/3ehfvAxG6dEZj8L/CHig0m2WEjmXxiwIFzih+aZ3DlIjqw+cL5SzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lilZnPaT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lilZnPaT"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3936easo1101155ad.2
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765339; x=1790370139; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1oWgDzzyzgn3DsMuIYLcEQN7MVtCq5GjZ4iffV4ihs=;
        b=lilZnPaTO2XLWQUNtZz+SOrL6BLn1YV6CIt+9OOKILYqqxRYpqoEo6v5mAp6Hczb7Q
         RnANXccWp7Gwb8LMaYf5Xu//x7/+hCk6Alhbw6rKu+JX9J7+8zEyMi9CbBDpa3KLNqib
         mAY2aB4SNIkZTABdSzSC6ye8XDlpMWyHgZIpkJL/p8iK3Sy5dbfMbZknvhulY823cUrU
         mlKgkXpO07Lq1lT0i5lDwOEj86Q3wX2lg9cXiXGcgu+jr//nBCNQ9EhPa7DpsZj8Y1f1
         zXVRNImyCpQd3k8fCnV2vKivXJAzbNeyO3TJry0+NNslHMglPvK2oiTc/+RfbdMh86Pm
         qazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765339; x=1790370139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1oWgDzzyzgn3DsMuIYLcEQN7MVtCq5GjZ4iffV4ihs=;
        b=s3fHoHW/lG3Abq9c6c2hL4fpg+HfF3tC0gFLcRZ1CsHS6M/UySIGQQr+QYDPZwuEws
         +7jMdz5iPLqbCiyA8Zr0EPTdmiL54TmxMmoOaAktvszI35lIhrndfu68T5IqN3+9k+ed
         kF0cro6d/IefukrYQ9ZOBDl1kTOaigqhI/bRi8ITQVL+IihRpQf/7uKSLZCdiRkhzvqj
         e38OfGqdTYmtTbr0XMLlhGEjA6tUjNhLlqD7qkeWOX9PDeZJFccpBaqVZrfMkpKhRqib
         v/yMWpn6Fhn6z+c313FTqKjNaRx65HmgumzQWEmUZ99zjgeWw1o1bySLoqUTs19Xaxuy
         4Jmg==
X-Forwarded-Encrypted: i=1; AKwUvBxEr5NQ5B9VUPglbqMkB2HIxkD8+fSGZ1LB37/6nBUe4AR7HnA3ezjpzTogGJAJMmiqlF4=@lists.linux.dev
X-Gm-Message-State: AFuF++m42xz6SPbV6R71cvpzIGobtWmYl9SBPCpXE4Jm1oNoa4AhG+f3
	/D0vPRmhzLdFunPy4N3EQNfnldr3vukupXEGHZBQyREFXQsDV0HpyLfS
X-Gm-Gg: AYBFou2v2sarLdw6J2eWqBzQCp2rfqJyus76wuab3ZNyzwjfjFBQgL5jK4DEm5+GBRj
	6cjNEAKo9ZweF6WT1dLJECSpK4uPcmFWZJiLeBpHcxH/0PuzCbscW3OawHf7Idhzx03MPu+6db1
	9grRmBJ24L7q+As3B2w/zxKDVPae2eH4umZCqh83xSdeIYDTE+M01tzUpYu+ENe1xSl/hEg03/h
	6hN3GKidvYV8APk7UltwKcW7f7gzj00bagW/T6fUdYwEGes5KXdF/2m5DcwB0oopu3h2BKZA7n/
	jdlMjDpNQhBBv1G0jQeGwR9wewiBJlMyddhlWEKK3zzmoR4GFwtF0y4xSs/p2tlFCXvWrDcxpXl
	jA4zW170U35cNugbRDm0PM1sY+yMQMtqkbWRf0eHMlQnFDJDv/ic3GlLKPwLHRQJYiFcfMA6mLt
	L8uUW6Y/NDdTcHUeoO99T3IQfVrsnrYNYppKe2OnTSVby1wtDK0loG23fRByMQ6VMAnuCtrIHwh
	zV8HavV
X-Received: by 2002:a17:90b:254a:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39e5940c49cmr6276032a91.1.1789765339319;
        Fri, 18 Sep 2026 14:02:19 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:02:18 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:31:23 +0530
Subject: [PATCH v3 2/4] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-ti-tps6586x-v3-2-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
In-Reply-To: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=6027;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=5NRTfbaTrkCr5LOdsA5VA+Gzr3i5fzEHKnaeh5azfmE=;
 b=Dblcb/wzIcyuZ9Qc+Jlt5lBSBRUbfl1pP3QmJWU/oxpdoLMqG2fr3Za6tjHJ7Qd0on2rJKGNt
 KcpF51Iu979AFq8ZabdLGx7W8ZK26OCYjHH+CT0QdAMfeJD2IBp5S/K
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
Set additionalProperties true as this is shared schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 -------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 74 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 65 deletions(-)

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
index 000000000000..aae951cdce8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Regulators Coupling
+
+description: >
+  NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators. Thus
+  on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30 there are 2.
+
+  On Tegra20 SoC's - there are 3 coupled regulators:CORE, RTC and CPU. The CORE
+  and RTC voltages shall be in a range of 170mV from each other and they both
+  shall be higher than the CPU voltage by at least 120mV.
+
+  On Tegra30 SoC's - there are 2 coupled regulators:CORE and CPU. The CORE and
+  CPU voltages shall be in a range of 300mV from each other and CORE voltage
+  shall be higher than the CPU by N mV, where N depends on the CPU voltage.
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

