Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9234825DF
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398019; cv=none; b=mak05YCh8ugElndHURIsiHPhl5NP62N9UDFg4FOr1bW8oaTALu47ZOzraknMebRLfzqR45LGk4xjcKKbwNB9C6XDc8dH1Dp0CKkHxSYsaAPtFEyyMXCQK4QXNivCq70kRhGZCB5eqjkTlWv5+FBDBzBGw9dSb3lvvuqFS987iMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398019; c=relaxed/simple;
	bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAvEWRDsLChci/zrbCqnR//sC2G7BBggkjV32sKLMgy4NIQmvIxxruQXdkyWAd8ycBb9tlODJXMunsuVOHfYE94M7pij0j19BJ0dtwRop6BYJXwVTgAg2xSXJWqBt3iqzx/IxvVIMOFKi9gWDYxdp6hnAaZ5wp8fsmYHTesibvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9nrs0NI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7kdWaUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9nrs0NI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7kdWaUo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0P1D1761270
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=; b=S9nrs0NII51EzlaS
	oPQDWtpnPaQQRLUIa8BGGsCw6DbMcjf6l2hropH0DVPM361GXEM7Bdfw8uKwdZot
	5dOgiLl6tw+aB+VWElqzrMmfCq1GH88Sa41UbYxNA0bYRzwTWYmxS93DiKmTotia
	mQ54DderMnj43hGaEWqkAwXXi3K/j6rpsGhQRXwbjH04nbzWP0BZhZza/lfcOIMp
	1pNrHYjjo47G5xuwQBxuKPBIzyWyFqSXimgw7Mm5av/gpzxNL3dG3wV6JYUqHGlv
	Nz6KPv8wCjTyjO36EN3wNZEWB3aExOdQV2sjiMZ7alXNteBk+XLP6itFWwR5O76z
	BZFdTQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex983e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3d832827so41687495ad.2
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398015; x=1790002815; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=A7kdWaUo82uh7Sid9CIAG+Weftyn4sXli7dEN62eZzohGyGl7gNaJgYu6+eWs7jxUc
         UaeajLQZN8aQsLH6lykaEBPcm7TsgDE/NU0lvqJ5cCXza19zrRMeuDZgwzZ9wwT1x2ym
         zHWGN6b7q6f0ZIJYbZ9g9rDvhdCoJFLWg/uid/MCvArlNPUP+FFHwhVzbJFipTlp+upL
         MJvOGSny4AUh+JAi7hL2LhRTvBMkcumfN0fNmmco3Qb8jvrsNrTpssxnj/eMGMX8WqAp
         AoYp9NgP3jSUe+eGunZtNhuYe5kqv4g28k9avYC4fBqpJyZlhmFbXXz5xSvdTPwdwpi7
         lpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398015; x=1790002815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=RkPFVwVCJqaNfsrYqsw3AT6TQNoxyRveArvltNASUm6XaV9isLTOJHyZ5Fl0Fn4xX3
         HKwHx6GqPHAbc/hhv8gSdQMU2lJP0EyWAAEsHB42qoF6uYCJhNuL9H0X+nQu1IaIi0MO
         pMupyEaeVlJ7c+ir9qNnvQbGxnx1Hzys2nvBiAltCMIUEUmcA9yrykZOUwXpqlbHF03B
         /0wlpiisQ/FHmSiCtvxaRuGx9Fj+PQPC8Vj1VxX0Moecz8b5GK8Y/6b4fRO/QudNmxPy
         0OaW84x1LWP8wRN6T9axdbw6W/oti1LVNSQ0lM37eaP5l1arwPodt6a1YvpI82ARiu55
         4kKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5B0EaoK+yidt2zrtqgekrY6SWl8dB194cIEAzrrvmCbVrO5U2okM6SZGu/IhE4FEI0cg=@lists.linux.dev
X-Gm-Message-State: AFuF++kWatcFCmi57j9AqFKTysKHDhfEpwuzXR5LDI6psEGDEaef9938
	RjFRX7J0I3pothI/Lv1lEmNZalq9XjeNu141tf23QUVUZt3jBNPf5+FrGxaNegqV/EB3baoUAIB
	+s57XRHBvJDC9zsVR0lY/nJ+ra7jTkJyYKjALrakBuC89THbVklMEM9U=
X-Gm-Gg: AYBFou2QDVSTgeQQjtt7iEFVDzXFdbz2cSUxTUFyvGg0hkGcdwmivYueQRIaAyYSJa+
	sZAuZfQ9DUFqyCiVowmugHMmZG8gN+krlOl6tKe5vvdLU38+XNVtcMFHFhS7oJO7xXrBj5+juOE
	qjx7cTEpSgW9z405d/vO2dtb8yUYPtZPOzx69X8VAGkXvDaS7Lnu1M3NemgouDSqPqCkXXeISS6
	fp6CoL0jHzSejYdXfmdUmTEZ7YPOkiM8YnAWEUKgt7PewVmFkNVSkHN3yvGyXsSMDr4B/1fIv4A
	0c/yzn4JPKs2WgBj+kZ/Nshi3mRXt/UgIMDr+L54pNKUa1ckwFMQVkAGxuxYjjpykdLQT4/YB5J
	2SWrXOnOs6unAlxqqpTqwtiKcMuO8xxjf8C56
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64686365ad.21.1789398014844;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64684915ad.21.1789398014250;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:09 +0530
Subject: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=3255;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
 b=9f7VltXLt86w6F9+EGr8WWpUIDOdDKEqN7YWpUaS4nIV6sFJpeL13CNDFTmp4mRqRZO347vQt
 fCuknKj9CbwBQX5SYiQx+DzSwdtAWrzVzAFYgN2Gc7+Nd//a8CWe0qk
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX9o2hlkL9HesH
 OKy9dZg69pAm25x8NkVhERMUeHQRBCGc2FRS1wXemjUr3Lazwi/o50R5dVbacKdzgkZyKtPQ2NE
 xwdABJtIgCKT+b0Wp6P2eDaVFkP3duL+mYcMTRSHpMEGte3w7ldXzO9uZpw/q/3WRrYyoB9y2+G
 FybUttiOtKnKijXwoqQDIyvtaIvNCNoJ5oYrTyG9Wbq4yQWvj3zicNBJ5x7TPyNEThShUNaRFGK
 Olk15cZ+4f6YQun++DMpoR+cZjZbN0hPeHsmgTsDG/cjnbA5bkDK6+o4O8jhTIr6bYkeAFYewTW
 TPsAGtrzou4blQ7a1w6mFPKdgRyJCD7teBFYkh29lMYMFyS1pjye8vj1Lhu4zuepFXONXyAq9MM
 pzLQ5E83ip86zEq6O9rybqW4ZEvCxWmAIJjX796xTFz6jg/df/RQd+lGNYT7SidJ3/lDThST4Kj
 +W3/I0X0E5RMfmD4rNA==
X-Proofpoint-GUID: 8mcwU3l78ED3Uyxlor-8tzgWZ88bgVG5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX5geKJSOfIrJv
 PP/uROjHp+jQea9f5XS21+kOLFmBTEr/geulOoD+7uq+1gWXvU+sWrMyBUVPpnvTGrvtgU3UDQF
 CTZiwQHLbB/2MAOTW5E+/WHjC2WQ4X4=
X-Proofpoint-ORIG-GUID: 8mcwU3l78ED3Uyxlor-8tzgWZ88bgVG5
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa80bff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VHtpXdJELXZ9Nr0wy4oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..8b6a28b81ed7 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,43 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0x80000000
+          - description:
+              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+          - description: arg3 (cookie_lo in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +174,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +306,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1

