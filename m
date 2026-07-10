Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67642373C1A
	for <mfd@lists.linux.dev>; Fri, 10 Jul 2026 19:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711668; cv=none; b=bNtdB9IJsbwOk6lEWLm9Chrz3yoJAAUeGSeQCP7Kz2gaKmrcRfP4gRIJ8JSmP9sWA1sBizNfGDjYbimbTio9VLmmZY6Tf17m0rEJrXvJ7HjR0vGt+o2AGlpf4UEiaJopj8nZys7POEg86KlLRdCyW2DJy7jCjtwTUPs7Udj+9mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711668; c=relaxed/simple;
	bh=35hLHc2b/IQ8hICngb2fk5Ut8HJYVBZcjh5HU6E5GD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEVYgpNTkRBdx35G2UstXpoiJiyzUUygsgDt4AXPftgMC9DV5bVuIjLW+WjV0wEUk8DtOFzpbpJ44aqF6KCjTDG/3He7GeoZq8h9yolMFWo6gD34k54MgY6fyNjeN3etL9h3oqjucH2uQ7XkrlDPN0MIRB8KNNl7YgY5Hy2DUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbzvZFUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbH6XtlZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dbzvZFUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbH6XtlZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3mvn1450878
	for <mfd@lists.linux.dev>; Fri, 10 Jul 2026 19:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1
	kNRIY/CA=; b=dbzvZFUrSyMfS39s70Li9NfQtd6RN3iB96qfN/5SGJEgmKknCwd
	s5YGJhTZM9K+MgquB4lHwdlCI2QF1BWApyR4ly6jG5XuUAVV60hyorcJKk37jIZR
	AKBMHMNqntb3nRfiA2nibkOhNNMUX4L2OU1+467oDh29vSiyQkiMIDqZSqIWyP0D
	tYZUFNSl5iFidL+Iuk/29PIW9cH9pkDvZFGgdP1BxC9YOz4WYm0s81JOD0twB5RX
	rEk2SIcrzobLHg0Yb7+CBkAawY1dBlUQWEnx/DZe+SuSb3I4qQC9HlzWNC8Cm5CI
	LmWu3M+HhVO0m84RVVbWJi3DQh3OLTHaTaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n3d5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 10 Jul 2026 19:27:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so566406a91.2
        for <mfd@lists.linux.dev>; Fri, 10 Jul 2026 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783711665; x=1784316465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1kNRIY/CA=;
        b=bbH6XtlZgnMC8WK1BJumn7VcY6Ql81ThcQVAYh2ortzO53HsJxx1dx8re2ZUHSIdC1
         WjS3GmWn58WtyaljGfBF9UWealjwYpaxI2K/ltajlYqOQtPNn77VSehf4KlKuP72ucDe
         rTvLZ7zng18xKUZxxEldNk1bZQzF9UB3CM2TTJEpHoxfS1tNKmG7NeqrLHjdN7Pxo6F5
         eCb8kSTDBRHoo18lURpGqjQXO/cMhZNvDLfwzTyUGWuIHwUCdjsr3aP24Yhme4CxqGOz
         xqJqEtAdmB80T7oTcWZGBLovudyZonwp4wH6ijTXObpPTjTsZcOEEPtc/UZjJ6VOxpFZ
         lRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783711665; x=1784316465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1kNRIY/CA=;
        b=cjU4XuVD2qxoftKt10J0ybGv9pN25YtVWtD5A4TuUbMJvmlqoVF1ljuOi9lrArgKGC
         n7ZBV8viZLlZFgjGdq0wBjeLpcAwaOlPF8v+LqzI2iurwCBen1XKVFcT6hnWxW/9lRMk
         hqmhceBJQY2+tKMDsJjWkucA5PJGwmoG9A5c1iTBMaOs/KEYePPbEOTX/ickQoLQwZ4J
         Es7lKe6VTXZuYqGwvxyn4CiwiGzQYpNVyY4WgD9RbQnj0dEXSZZbQryvpJZwPlrHPHDm
         x7WNqnIoxwd8b8+vzpqau48NX96atYxj6jSQds5VehAFFEy/1apocH1cvKlOtblHw9gi
         aS6g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+ypvxritqMuisn0VblVBbu0tEcJI4i2JOaj8V+4Eihv8lm+R0986klSUJCpIupahaC9M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Od3L7wvwHP1SGpixXlWxsVJl24VX6i9EwyCCNIWKZQ6DajMP
	K/arftvKIfwaZU+C8ahZbpR18Ep1moVxsYvAZY4GDNni9UisKeU0fYASKMvsvSjPXFct/i+5cTb
	42A7QZMmmLO7m0rvjL69NBIZS+Xp2p+detLXTqjXiY6lzTO1/Yw1g89k=
X-Gm-Gg: AfdE7cnvFLQdkeOMvFiO/NxIKaRQykFbbL/KSNmDTqRiU1kw9qvr6ROICT3TbvW+a7g
	WQXFd7xZ6MVhyL0HKlOo76vKwTRhSDzHtGI4gKxFBWNaOfl+EJbU0SiRLfN0K1/Sv36NpPrgE5o
	QJidm4cs9+fPQt7JWg5NK7w1j8o7rS0z69JZLhcn+sMeS2DwKRSPX8SV9u58tDYI1Jd2q/ZaF/o
	zoQOTU6o8maJDFRQsHZxWApjhMzkRWlyPxni6pcZYbyJ5DqaAVAx3+APxFLRHxv18Cz0inrJh4A
	DW73pWeogZtYhQwp3BxYgFG6lAcoUIGxQcMvDFwrvgrBJuYAzhwPvJ+mfrrTXCZMLMXdhoyyFX4
	B3OHhI8jxQZ8oe/ob0A8VXkvSJjXhIr18L+2ThA==
X-Received: by 2002:a17:90b:5585:b0:37f:ad5c:d18 with SMTP id 98e67ed59e1d1-38dc75ed90dmr278456a91.11.1783711665115;
        Fri, 10 Jul 2026 12:27:45 -0700 (PDT)
X-Received: by 2002:a17:90b:5585:b0:37f:ad5c:d18 with SMTP id 98e67ed59e1d1-38dc75ed90dmr278424a91.11.1783711664432;
        Fri, 10 Jul 2026 12:27:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm45817907eec.27.2026.07.10.12.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:27:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Hawi and Maili SoCs
Date: Sat, 11 Jul 2026 00:57:37 +0530
Message-ID: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE5NSBTYWx0ZWRfX8qSzaReXvisH
 yHgEu1V9TMjsOQqZeLBbbaUm935rTceIkthojaNxVrF6QE9LrlL292c6PocdKJ66/Yb9Ni4/oGn
 7yY/ctXOmw5NcDzjSDLneX9nnW4Vdtw=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a5147b2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=w03f12j0Wgemb4Z29XEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: LBzEbidK8iC9pwe1-nH9RHCjwaBY1Rhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE5NSBTYWx0ZWRfX+MgJ12piin4A
 PE+LVTfQSpuI7bFNCmVqFf4tgePAnLbMuPpNnuO7Ex8QIr2lh7e9toC645a8KOeWRhgNovY0tpd
 YzARmx+JbLI6DFHwPLszi7juAB0fVP3/LOpdx6UvB8eyNQKb+6VVeniznrvFPbvthpxEwLx++1P
 /yVVvW6Fve9tRJZNnq39ZwR5o7Ai8r0tPBuZg9O+LjCr2SQeUXCw+RmxY9qw97ySjO6P4iyaFMP
 ihilhn25sfneaXShgq6bvcE3Ttk5rX2CNrRMlRiMvrFmfC4HE4t6MfqOWK7WAlMK4WgEBQPpRQy
 yzqLpF4M6gYPlnHxLj9/ndFQ+/qQfweyv4QSSov5MKl+x6leKzTPUrI8OjRVsnN5yM5jKo+2WkL
 /TWYKm+YuY6srF0us4ZiDR3AkByT58Jgaw+E+CJ8T+Uf2mDMZimdsTyxLpRsH4BwYddFrisReeZ
 kUA8sa3nS21aVKaphKg==
X-Proofpoint-GUID: LBzEbidK8iC9pwe1-nH9RHCjwaBY1Rhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100195

Document Top Control and Status Register (TCSR) controller for
Qualcomm Hawi and Maili SoCs.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 7dd2fe035e6d..297e91a54a1f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,hawi-tcsr
+          - qcom,maili-tcsr
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
           - qcom,nord-tcsr
-- 
2.53.0

