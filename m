Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217251C861D
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049470; cv=none; b=W3EK60ufgVDV9aiUs7kWKyiHZlZvz/QfR669c3LFnVH8xSt9IyJih1/ydc29ng23TOGc3wY/vm2U6K9kVwh2dYe+dDqdR37P7asZekndlVAFys91iC9CTA64CK6L4jY2h9CzTbYjcVkO6/mRVr0nRQk5pVWCsACvTl2YCuqkouQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049470; c=relaxed/simple;
	bh=IeB5JGZlGnhunhqpImylStG7bJZPq9+76gfyd+j+btE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cPHjAx7tXJt03krGkxzxDuam9Gm1odz94toS8nhc8cdiERo/g4aLUmHCYO/XBoqzaWc1jFEK+eYdW3v50Oh2GjNj/qYipGTXaHhrS1WHpHsB0tkDKdem4GLl6otP6H0vIruwKwPRS/827kITqmcl/EOUTbwHd2uf3ra2Xmm867U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ef0V5nvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlchodnZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ef0V5nvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlchodnZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6qSi1003075
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=; b=ef0V5nvdxoQ9Uunt
	UqGTUhKqlW3C9z290Yj54z+LupZDTZ1sjEjCalHA6STcYmlrE3Db27rSKHVQbHGg
	E3r0Sm1EaLG2Ag+UqnBfvoC+ocFB0xpqU/2ac8mqdwyG74/EyykQXlUJZqbGsMbc
	8tQUU0/Mr15luVNcXZAe6ha3PP0zib5JdQL+S1U5N3coaYk3peXoHaeHEYqtB+CW
	Zgj3PKsbduMuasDMRAvPF0pwxXM1VabLZ4S1dXpT5jZL+iofIoL4PdXNeLr1Iied
	RaCpNWPJGNcs3XgZJdiwzYvzNfAMMcTaupug8k4qOYsGCmgHefWX5raSoxa/DaiJ
	RrENpw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr13fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1802241b3a.1
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049467; x=1784654267; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=;
        b=jlchodnZTcHUw5vx1Wb0Xer8hZIcJ9LWRANt1mvAxN8n1lunCcXOynN/n6fylidMuY
         tsYyVgiiHyToMpodeRF20z8IXZRq0VZVvaGRkwgz0oHpNQ1HfgerESn3rKKTsPeGMLHU
         xAwJoM6iuOzzwlHiiGrY85VVWfQ0CJq+pdaWnxO1WjTm+BoQl5JLBuT4Vx3xa8coVksO
         w7YNtcz06S9tO4v3ZXm1X/yq1F1Hv6RageaEfF7RkPmoeba9dXWlVpITVZCgvDyfDUxv
         YsY+aCrfIx1iG8jq48gffouw9V30PYAjv/bQi/pyQRxOYuBPz4MmUAK4/9U+4kCIG3+6
         1QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049467; x=1784654267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=;
        b=OxHhtlGSNY5N2QzrbV7P75+dlVCoYxSI8QANh86DoMY5+zOkcxzn69CbcNqVwdqJpS
         sEdos3iJYmXBE4iltjJ/XJNSoyLpNxRhmO7X4l5Oq8CXIGR5KwttRzxM4wX4uqyqLGdH
         DJMBqvG/k+omc7zZTD8dygAKNhKxOnDQF0UBBTBN//h5NF4blptmO2d1IhjEg50/NWTU
         6yOCV3pCTs/i5AGqwcB/7cj1hEISPPF3OBjZuq5eFtx5w+Dkg0V19G55bGn8k2AprlRd
         ePtmkkGh2yB/e1HGw0TlDpeZNifS6F0i7Qu6b0vPe7Q1cbECMAml2l+ZfClteT3UTsfn
         Sj+Q==
X-Forwarded-Encrypted: i=1; AHgh+RruUTpzdmul13QWlt3C5+Rv3TZhZgZWSYzbWe1nxv60BduoTo3N8mnzYFi4aNhUcM8UNcI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy82f8lF5v2zE9Z0zE2XER04FKMRzTa6fHwfV4WLOLaJy8HkWxV
	BfDUgdng4jQuvIkVlT4fGkumRiAxvb5u1qcZtW04L0jNYMWCzR6ak7spcJq07o/P9I9pgGavhyp
	qB7nEqZUtb02B4O0kyHrzlq1sJDpOvJejazHeinnWRrmf+w9dWbU/eKU=
X-Gm-Gg: AfdE7ck4zG4Wdh2OhZsBZeoiuwinCw/KrMPPeE5vSr33kmXaCaFcP3DeB/qxo2vVwrb
	Kf3rL1FiTOhMLHnX13aQNjXxPTH/85fDMPlCzVZXec3mlvPjpHEm+oa2ty1sDs6JJ+xNOyKZWYv
	MZXwsvRrvWOAlvgu9kCB6fG6K95IFHKct4ub1ICk/7jaMVMEs+8pJfeZXXKfW38nd6jdk2kONKr
	qkodVP2tUo163mb1hcQykkVhFjCtlFalyf0QKuvDBX0bjnL7z+d3W9GQ7Q/99cwzEVZYo3j0Da0
	5ofYozp07/Ey+kBKy8ioLpH8thY2Ywb4EnZZvKAGll+Z39kdffDOSdUdemA2zj/viLNcR5p82+L
	LlL+deamSBGcwFPUl/GW5OeleDX8QIJtryLzYzTHjYfPHIlI=
X-Received: by 2002:a05:6a00:6c9e:b0:842:4982:82f with SMTP id d2e1a72fcca58-8488ab52c4emr12500744b3a.2.1784049466593;
        Tue, 14 Jul 2026 10:17:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9e:b0:842:4982:82f with SMTP id d2e1a72fcca58-8488ab52c4emr12500713b3a.2.1784049466153;
        Tue, 14 Jul 2026 10:17:46 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:34 +0530
Subject: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=3015;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IeB5JGZlGnhunhqpImylStG7bJZPq9+76gfyd+j+btE=;
 b=Rqul/vs6hKIoNIq8CYBVBXktxm+9XrK1d2fQHxlRs0lwZTte0K2Wy0m++KG3ub+9uPYRfMpW0
 cWLGWZTns3eAts3X64dU254nt7q30B6sK3/wB+hz3gjRYl0RgDJsSwU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX0nVj6FwbXSGM
 fe7J4EIVUW8L/dYsaImsuJR9LzlxQIdNjA01im8zWPtyKVztQGJaqdE2Do75dkzs+yprTuMhrAH
 M2Yghmq3EuzGdbQebkllPZHN9CDxm7g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX7JfpI7NakNhA
 Cc9DhbqQefFiEUEpviwuE/39Qi9NrQkTHMOB43PPx9tyf17xhx5V5RTyGAzkIfU5z7sBf8igF86
 YKwKKiUeKsn2quI7HlAgiHRpUDAEEBS3gdVpXrAyNMGA3dFEFRggSLrGd5uSUNzzIAL3+6HC1rr
 etSTkz2N2xw+PVLS7/0KD0EcjL7M8/ZiLQhhDF1r6GglVnfPBtLPIfwulGtGfzmtyll8l0VrYAe
 BDnmiAyTOXQyf+xEx+iaihqwoIzbPAJdkyzgVo9pVe9Y2dedTbYqmXn1kniwksQQkLZ9Ya3AH9W
 hA0umdomBatgzJ+dw97oQ/573zUTceg/+63W1Uwi5lRBfd2QIkD794MRqNERhYyti/yTJtU06jm
 NfzvVV5FHCy8jhh/JU5JGHHd7TCNs8FaIoqMo9n9nCebJ4pVLMdhCJvA02LQua65QJmuMLZHD9+
 XqtJkkIg364nIRdnhtA==
X-Proofpoint-ORIG-GUID: QaF3ybcdnKzdDb93ZaSVE5Jg9Z6-SqE3
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a566f3b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QueE7lSFyTnArNAPXxMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: QaF3ybcdnKzdDb93ZaSVE5Jg9Z6-SqE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841..11b90e8affb3 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,37 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    additionalProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 3
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
+          where:
+          - arg1 is reset_type and must be >= 0x80000000.
+          - In 2-cell form, arg2 is lower 32 bits of cookie.
+          - In 3-cell form, arg2 is high 32 bits of cookie
+            and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +168,15 @@ allOf:
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
 
@@ -260,4 +300,18 @@ examples:
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
+        mode-needscookie_64 = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1

