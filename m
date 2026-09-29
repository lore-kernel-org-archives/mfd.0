Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A263A1E80
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 19:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710242; cv=none; b=mMWhOO6PdjS3ramM0h69q+d2eSiEMV7ETnHdreqb1OoM42Q84OB0gzkCcj58c8Plu77wQBKy370fZrWk1I9ZyJjKDiz1uGj1StTHE9rcOD4dE6J9lu3h/8SGK2mS2sq4zBsUx05XcduXQB+4XRszECf+bggKr1SKZg0zeuPsoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710242; c=relaxed/simple;
	bh=nrx9PWS3jdg4LqtwUbFvGTGJFxFJvxOwGLbJH8e2/5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqjPruBKh/E/x6E5/FOtPO0BqSi9jZeedHActb+oTbydPhOPQMSOaYhFOuqIBlgN+GFuA1a/1pgXZr6LcpfVBPeapS5/RZ7OIfWrPLdIz4hO1l6E6Ol0NNjVhfnTnbAygWICxOS9Rx2ba4zmqGaC5mG0Gx9oXWrgNZMIAD9kLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7gjLsKi; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7gjLsKi"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so314041eec.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 12:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790710239; x=1791315039; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGAaNaI6MWU2v1/hJGrbMcfgTrexpu3RiGohYIJGhaw=;
        b=Q7gjLsKikikxl6rt7Tp3nMK+9l6jKQQybEJdjbbuHLq5//hB9NRD0Ypgpexyey6rLf
         w8iKqcsvceBiEGs4aJejN4OWNV8p3KG8crE92S8c0f/gnyPMtLrnsia7rYJk2+tnDxyv
         6WdRRrByUzlhFSLZvEzlHA7MRbvNVSoMGA1SOEGzJQtOta6H9OebmFKqU8+jYTEOf8uz
         C23z0xRtGhrSQFE2b21s/rRrirduAdVn/vJOD8kgEsG5j0saXw58YMAhbBfxMOMf5Pk4
         qPhOUVfGpI09MBSCpWs+H2STFb3qMvcVmv53xW0sLK90nS6m27xCh3lE/0Xn+1ig7ZbJ
         Qdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710239; x=1791315039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGAaNaI6MWU2v1/hJGrbMcfgTrexpu3RiGohYIJGhaw=;
        b=GcVsuSrXmrtWPdtUhTJwu6q63aB4DaUoWupaYGZueeeLnJFbxYxsqnV+4Hm1T63JuA
         WodCCEAo6E7zu2XqTwqb61duoY7K1U9+16eMWIwvoMvIxUoESiWgj3ev9CgA3cVn/afE
         lBqFpJUGefCt/gzwSDb9s9CGc827xlHVyHwAEObDHev2Yb3TqbNXDTYfpXR1aaAPdMnq
         fGpta326jx02nmC8/ibPyTSq2TBNiLUNUkMIJMrYKJrIbyKLTHwyW7m9zlqrAwQvDuuH
         YZ+twP2TpAg/z6m/X5ArhCEhIxmMJw5GoLW4rpFU8vLc7owKRG1F4GpbUP2O/SbYdWDM
         +3JA==
X-Forwarded-Encrypted: i=1; AKwUvBzHwy1B+dsiMwujlv1a8p+hC+XtZlXjBz6C61Zv+zNNOlE7nczrXXTnW5mY1IGNe8T/W2w=@lists.linux.dev
X-Gm-Message-State: AFq9FYKAuF0oHiLUNCr/2x+sJnchSZf4pDEzJuu7dPtHWEIoD3xlizgy
	vMuRJMmliFH5q+F7DajoVlIcm+Q/FiehvLEM2NTQuEtsyYFqrUrUBjY1
X-Gm-Gg: AYBFou1TKNIrsO94lURieyj6IXy9Qkls8nVlEJl/5FGq2LWjOqlYp0wGoSLSQaxICoC
	kHM2x/mbiMEl0lBZesNo/0ay6uCRoTnoJORJ0neso5FNf2XEW0aTB5UekhhhH8mbLrhteNGa8h1
	vQIH6agV76Qcj4EYXNIfUzJo+mrA7AHAkEHL6EJe/m+dxjWdhD0xDOz8nCJEKrRoq0bdQ+oLIpW
	TAMZntr6kR768RZJzl7U4ufANPEv1dlPGx3vjAO0Ys8iM3QZ9+1yX/hKOCnYJCgrb2IJYXVQGrL
	oyMGz2Nw0l55e8i47RMWeI1gBF7f+XI954o6skcfYKFAq4+xz9gT3zuPBhnaaqyvzZ2ILKEin01
	slnaBnA5Vjcd69LNOHoXZNFTg25kHZ5kORNflJkKnUYpTNJA+tg8KmHaUKEpFGEZQIozbk2Vfjb
	zPMZc0xDl7GZ3RYtczWWo0poUEpE+i6f4GKnqepq2q7wKs6fsJSOqvPHI2XxItJcmvCYJl5ZJni
	lagGM5kQQ9WcluW7s1H
X-Received: by 2002:a05:7300:ce8d:b0:343:fdea:9a0 with SMTP id 5a478bee46e88-34c666281edmr481185eec.2.1790710239128;
        Tue, 29 Sep 2026 12:30:39 -0700 (PDT)
Received: from [10.211.86.252] ([2409:40c2:5054:69f0:5c6b:5195:5b7b:d414])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386b6bd9sm1275349eec.16.2026.09.29.12.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:30:38 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 30 Sep 2026 00:59:43 +0530
Subject: [PATCH v5 2/2] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ti-tps6586x-v5-2-aac0273b5da3@gmail.com>
References: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
In-Reply-To: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790710190; l=3317;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=nrx9PWS3jdg4LqtwUbFvGTGJFxFJvxOwGLbJH8e2/5c=;
 b=jYVGRLN1rCeA5gBW8wN4yvy44oA+AyGQ8yWRJ8UyoIAUYvVfFwjZ+r2YOpUhCx40CNPw75Xyn
 0gbgWBw5Z9ZAXobjAizQU1JdNpDASKvErGkmpZY2poMs4sg3Z394ON6
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
Tegra-specific regulator coupling properties. Update their dt bindings
to reference the shared nvidia,tegra-regulators-coupling.yaml schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++++++++---
 .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
 Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0cd..209dc97909bfc 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -97,7 +97,9 @@ properties:
     patternProperties:
       "^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -110,7 +112,9 @@ properties:
 
       "^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -123,7 +127,9 @@ properties:
 
       "^ldo[1-8]$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
index 0f2901cab8afe..a2778c35919b1 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -22,7 +22,10 @@ patternProperties:
 
   "^(sd[0-4]|ldo[0-8])$":
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    allOf:
+      - $ref: /schemas/regulator/regulator.yaml#
+      - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+
     unevaluatedProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
index 90c39275c150e..6768fc6ea0d3f 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
@@ -20,6 +20,7 @@ description: |
 
 allOf:
   - $ref: regulator.yaml#
+  - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
 
 properties:
   compatible:

-- 
2.55.0

