Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33047471438
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658668; cv=none; b=VBWAhFGzGHraB7SfuWeumwzSFV6UIQOkfJYaGu2IbcRVvrehfGUyPJU04+DaCpD05OOVH+5+3R3x+dCjjqVwktXSED4rkkUrt1cr8+xEGrgX1+gc3EbS+4tm02w57Jbh78MOPkwDakATDQ5fM8UUIk7UtQEKL4WcRulUjVnNWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658668; c=relaxed/simple;
	bh=5I5lbz0IkGnSSf+eD2DnilU/bDrc/JKDX+01r0iVHGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhRGq9JggVqZAy+6rG5ONb0C38clSAO91jb9FAdpmUn9wNuymCpQSdKcXvrPqJydTtW/pfbWuAPHLAFZHOHRmtO5YqeBDg0e7bIMsHHdRF5/FoVrNt42v40ewFAp3Wm5qe2ElculVt9HXs1NiM3Yx/Cc0oKovh8avMOHxWy/s3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dx4oqu30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhCGX9Iv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dx4oqu30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhCGX9Iv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH323S2161272
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSSMm1lsKC/enWVAG+Qh69ldXvQhKbd1hRZPY/y5bDU=; b=Dx4oqu30nVdz6ojr
	CCeeMTi2AXPnZ9KTsF68P6SJV7cSjXKycq0y9Zbc81DWhTMU8emK+QdJM9t7qCIO
	iJFL2/nueCDeyNjMtFTt3LEyFFUnkV9iD/6kBLLu9ZtYLHnDpNC7Aqnkss9NTzVH
	cWvjL5x0NuyTt1N47xLdEsFiic0K59vWgMx9VrMSYSZgGFCF2caMVH7gW3qbxZ/g
	TLTe627HkyLpH0ayhss3k1YHPj9USXBtTVGc3XTizLC1RGR641HUvQsNGvt+yHl9
	1MOEY2StDt9jF8k/gJyczAFNy39g4+JfBY/Qr239WP2a6EmSslvsPYKlgw6v1I26
	tNsecw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41jy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso7556768a12.3
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658666; x=1785263466; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSSMm1lsKC/enWVAG+Qh69ldXvQhKbd1hRZPY/y5bDU=;
        b=UhCGX9Iv2QDDYNnkdIohFBTWo7cnkYbx5JcbhdpYsbVgVILaVpPnzwNmf8wKRGecah
         gyopfFeOmq22nVcc1U3j5ygXjiqY7FyksdMCA151BPaA01tDA7FQ8kounfTj0fhdY9KE
         leij/0S76NMdIbmi1ukcOXKkqcksqgSoTOVcsuUETQGHpriyIK22Y5XNDXOMUSKWQ/bW
         BlfuhRyE+lcb5O6ctip2ZnRumX0hc58umwUNbKk5nKUISWBt8w8hHOW/en+439VcB99+
         5iHg8YloUrdUqth+o5p80Tw/MoKHpmaXqqC+ElySjKbZ9Y+8CcJxJRpyivZqWtk+KDxW
         D0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658666; x=1785263466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSSMm1lsKC/enWVAG+Qh69ldXvQhKbd1hRZPY/y5bDU=;
        b=MtTGJxO3bVWCE+8U5sqm274Mr19BN/AAbZ0McsG2/s6axxU5RfOqNIEGnyu6OV4/rU
         gskf3WqrmSe0dgdesKJapVl9DOZwxQBiB1QCmLCosiFNtFOSJnh5jZLnvgoVngMjrT7y
         4kajiA59SKP001WhUav0R4OOCi+q6KqJOOpr+xzvO2MPRp4jaaNVOUP9N3ZjmC7bHE4K
         mSv+teJLoDLi+Ksh9zKAhzh/kq/qae1M6FKvl/A5HFmNuqF8n4L0YPEgGFQCeMQZ+OLG
         Ktw3EL7AGLKBm9YluZZ+/dwjxY6ejzofSvKojf/U43vgz40C8Seb+fQD+6hj8Wgrhj80
         t86A==
X-Forwarded-Encrypted: i=1; AHgh+RpSusqxsxdytn2A0OuV1YwZk4pfE2W15E85h4ki4pBBW0hAVLhyOqU+HsA0Oa1QE/fDRmo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZSN2ewJ50rq/6z8VeeLSEkPPFmQXJDNP5BbNDZkPrcYwewQ2T
	d/Kms0a7PO7I/KzWdyn14qQPQDgYXCkeYzrUwkDhOGR5BprOnTSBpD15+GRzeUxJp0WIF3T47yb
	g9yzpc5UGBeuNmS8XsKQqo4TgsfYojQ4Ry7annee4V+t4J6lj5tWUp0A=
X-Gm-Gg: AR+sD10wm0rukGiSMmZ8wGMTHT2wqaoQiTRA91KF+TE0i/U1w3QSS6dDLUtsZaZoO2I
	HPW3+3NdvmGgE43bQExNyaYMG2QjPv1/mLN0aIYw+/+0xIXz8dJfysapzJGiBwwN5HB0K4jHwy1
	XuJ7dsPRcl6Vpus+yi3Z9nwIzb52gWEfrguA9X1wwV1EYMFZ7Or2BxZ+jzz+NUpxq0KyVy8AEbK
	mQ+xF0KMgNjlkOzLWZXLSTTL4qhYZM+e50moPEi0uoKaTtntKkPwoF0P4CdEXidzXCvCiv5yLGz
	y4NJAofuQe7iGVP/Rz1/mPPGfmme8DV08Ij9+uUeU+0Ayzy68CvxSudG4LVBnXdyu5T8ixNIpg5
	U94/X/q7z/YgSxa0HL1chMqEzd6r0sBvfx2o=
X-Received: by 2002:a05:6a20:9397:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c3ad97174cmr19810356637.36.1784658665667;
        Tue, 21 Jul 2026 11:31:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c3ad97174cmr19810287637.36.1784658664900;
        Tue, 21 Jul 2026 11:31:04 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:31:04 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:14 +0530
Subject: [PATCH v2 09/10] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-9-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1082;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=5I5lbz0IkGnSSf+eD2DnilU/bDrc/JKDX+01r0iVHGs=;
 b=iwia30B3J83j/rQiJVBqhYlBA1wPb+lMfV//HNpSoPiYboiackd34tc5/CtbDWdBWjEKbVJHc
 f+ztwfbXqDZDQrNuTKi66szybumPag+1gRvYaYXojK3EK/jlPbQwiYV
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fbaea cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: X7JO16NIVjTL-Spwr2nw9EW454qbaYtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXzldTqhpYPvFc
 hclJ6c45TvJZzr7tWP4Abj+rPqTJLbdF3cYR7DGDqzxX9gaBJJxYRfki5OGAULu8tM8jtMNMhmk
 iHEfuJxmDUEU83HrPhywA0E57IUeBjSztExukC7TMDul7n77twswfhTzm1FXNmtFw7TRJCp2AV1
 /6Uq5pUGxwet9PqYTK8icMhu0745X2OJ++Lo0FFKnqMJXqPfRqei+/Krk6G34fCm7AfsNN0TvsD
 Jj+pYj315P6Halfw3xyddVxLCZPHWm0xB8cOHBk5vw64n4BRT0mG+gNrjV+Xhxy2cfEhhNdaAEh
 PNB11kpl0ULrwLf+X7JskgQSTO4NiTkCp3rrSKNLxG6ICottsu/9m1jrVcQDzKMImpQYtZAgcLb
 mv1bmWWdcm7OFTst8DTaeH0T29AYnevKKzvZO4J9oN5bnCgcpefhqcUB1mHdcSHBWCCF21tBGmC
 znc36/ve6DEhOKvBJ6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXzrpMw5/9RWSs
 Wl3FtGgbocNYMKsza6OVeCqjJ06zNRxHMl31J1e4vu4xXB0iCPGNd+fs3TmLe2ICJid65uxyp/h
 MsEpeXvXikexe2f/ZXFS95doNvTFC7E=
X-Proofpoint-GUID: X7JO16NIVjTL-Spwr2nw9EW454qbaYtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..1f91e788010b 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,15 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

