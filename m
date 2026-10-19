Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F14E77E5
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409168; cv=none; b=oKJz9+nnMaTPNWzm6xZ64wp7llbhyyKylRMhIDaN+knRWni98UtkkPJeAsTU5CFdXV0zqZyqrkUTiL6rM64l1U0IsxQF6m/g17eu8pOhkhpeFOB+6MVErZWeBwb1f9JYclx9Sae0T8tVBwpglOZVfJ4gNfXzC1E4Bz/eT2lnl8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409168; c=relaxed/simple;
	bh=/1u112Fp/QaTfq2TFsBWcfozg9TsLnTJMmUIeYDwURA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZigoOAo5v4ZwpjpKCBRhdYeOq1eXoayqlqU4B6WAOQ0zmsQvPSNnbGDVDJTSNnI0j46pPU8ltER9lTQJurek8b9rg7fQGyXBfKWLfFtmuXTo46Jjd6IyPi4EtUBS0lM0SZglFyw6JiNAAymmfvhlHNZvLzKAUl7nMCD3/WJfvXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvS3tH42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZMXOREd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvS3tH42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZMXOREd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P2gf724559
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=; b=CvS3tH42DqGAO8BI
	Rgd088K/7wWEtXO00Pdw3OQhz+id7l5UcTms0iJUwBKSz2CueFMhT6f5Qp2YqDX+
	wVFk8iKh56t/a+kkjScibD1zNqWAJyVMLRxtVFstOxZpT30a4BAcXsSmQEXNdAI/
	ucPj+TPbkS3Z/mylFblUeowjss/ExtZGLk6VftqOpdiQIE4rUFQ9bDy3ROKDceny
	mMpzzIes4BrkSkZ6CMfPucSjR2TRGokHMjyXzb0nHG0GxNlfj8hN0cDItZyzJR+N
	t9YZS2YnLNU4/W27y7DTyoWRtQ4HteJw3KdINk042JNLocKV6JbZPSrTir7F/ulz
	qQng2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gt72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso398926685a.3
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409159; x=1793013959; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=;
        b=GZMXOREdKxUwszXtSIp04RlCg7c4et6/lLX2z95GDvEHToNR1cjr73RJsJI8/lP7Iq
         e78VUu0pOEe656bO8bYdcn/HJD8GuLy6PdbM63UJwg1Mgtkwwext5+3Orb2UkgbLnlij
         1vq9TrbNo1ANYSuS27ZKmwtMUp0Ungc5FNN+CvSegxQabV2EqZKEMh0k6NgMkOOX4R+Y
         sVZ+TZf5+ibVfQx6W2Sq+zQ/jzgL/gMBkIW9RYb1wGCHM9utEmzIMg2aQd/odg435V8b
         XUwlxoAkw79yoMUIdZnijOUGF1WPc0G0e44/E6YP0jfka5RfU0ECtZzdLQIx+uG9oYqs
         Y7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409159; x=1793013959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=;
        b=mMJTStys3vJpWUIpRDeb32JlKDtnkeCqbXCWgbSQu+nDw/5FnJFVRy7NYLilM01491
         1/w+EmX4lxY1SmDSGhT+UGF7jcROyZAPOeZIc5VDeqHU5rOpVbhC+guJmvtn1XkwcItX
         JBk7bUDsUCJKyYd3HoJlPhOhw3RTIf5wcAEQZZCeA/vZuh1EGCMOGZY8PBOR2qRrNuKD
         dXkdWCwwK1E8TSwSdlc6L4hxG1/HIdFkHhAdvULOkg38gNhlbMb0OM4npglab+NWsH/z
         eiFW7xni8bsfmwe8DK+iLLIs9MtlFuofmkw1V53cknrztY1CyFM+UdN6seivbT1Qccxi
         zGmA==
X-Forwarded-Encrypted: i=1; AKwUvBxrxmdiKtXUbuVm/VfgZACWwlgIIcZZQq8aTpNfe2lUQWzw3VEnpO5krrqT/QJSj0jrdj4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKbv/RaPZljCx3U7HexzPfQa2FTDZmobEUIS6BYV7RpQDt78WLl
	CqK1Oz+voKIj34gTE7qLv9rsEH7YEfuTlO0V5W/DBczEIJTsCQoqGkmnWqQvQl2VipdOHCvPQFd
	tyVskyNMseB1C3qZEUeHX4pdxcxzq8e/TAXzql5CVgcS4jcmZYtExYpk=
X-Gm-Gg: AYBFou0zQw0fTLPVzzBNo0tKXVzJjgngmkZ1PWhRBbye56yJzQScRt+SAT3Wr4QSuHj
	nLcZtpusiZLp1H0bDHPL4h318/TNZKP9C1/EG0NEaB2uQ1+9xq8AbMCV2SGGXsvZ4NeG15wUmTS
	twdBTxCiyCXOnQDojOMJotm1GoJGH7VwMGcfgUm99nPoyapgI7CN9I2wJhMQhvKPq5xy5v8nO6g
	enxbBwNLgpv2V2s2rsJvwVIYnuP720iYH4dLOOtYkGV/7jsLXsDnOFG0CHHvlAtr9Xh6D3TKciC
	1YZMr4MfueHkdsPgu24tswTzjIklhuu0no5j6x+FaQbCahj6wp4uBzX88zf0LCW4Iy+Bp+gi3or
	AstIHnlueHkZmWy4QTSrQS5XcfZ4IL6xMh9HNJZLJA8pUGwvArxBVUOx5QRbKYGcYLkFwHjgUyq
	9CCjSqgOgm0olQ
X-Received: by 2002:a05:620a:46ab:b0:93f:43a4:a48c with SMTP id af79cd13be357-93f43a4a64bmr140650685a.45.1792409158972;
        Mon, 19 Oct 2026 04:25:58 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:93f:43a4:a48c with SMTP id af79cd13be357-93f43a4a64bmr140647085a.45.1792409158481;
        Mon, 19 Oct 2026 04:25:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:41 +0300
Subject: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=926;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/1u112Fp/QaTfq2TFsBWcfozg9TsLnTJMmUIeYDwURA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f46xEAVvhENHT5/cr5eUC0J1Mz7Mv7VIO563
 Lrnc+EFNdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OgAKCRCLPIo+Aiko
 1UrkCACS72+7BOx9ZN6pTVSh4/cHz0fgq5dzxAulElxL6MTXCmbF238hFdvgoNdU5jtEncQj2Ss
 LIXQ9uOyDDtaw9N/usGH+no2wTcyPDCOo4uF63tPwaqL6it15DOogVtzq+L+8lYnJP2aSaXT0TK
 gYdvgG//oqkXLvJry2SYpNrQ80RmrtbGk5gLa8kA/wCbVnAwQw86P+D1C+QuK+Gt0s72HPfmdg9
 6m3AZY1EAb18yEAkXmK8vTALtOC5KvM7eIubzahCz26PTHU7dE5v5n/B09JcMbEurqn2f5ylspj
 qrHYCo2aLzqptIZDJl64ddZtb1TR5gQwm/ltogPmQ6msJh4D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXxvfOAQ6Z7s7o
 MsSMx7xzIRCGfJWv583tM/OyAE0nCEWP8bsvXTREZ1WPvL7HlC69p0NXx8elzetz6QSZasCWNVh
 BLBSn1Q4CHsFdQ5Pk5Q0W5NtUtDAHrM=
X-Proofpoint-ORIG-GUID: jvY478rENUjwj3EYLffIInVh4byJqwFr
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5fe48 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=iSqtJsaWCaQ-tE2kz_kA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXzPeY5QeaFKbe
 VK+nTEv9gxOClx0HzAxu5fQ0xS5uIqyi7Lfahmdk/il3BKvhWYGLXXu9nXyz6ZHLwYvy7PAweCI
 w2licrYzBY2G7MV2GeTkfYE5sx3jaghj5PxVDP7TYm9PdCFT18gB0r2UtPFqgDXfuCkh/GAbL1F
 li8p6JsgjA1n859Dpxv0SlQpgwVkGJn9n8vPunt2BGm61mW6AAIbjCu7+iyTNLIVZpf9F6WscMV
 CBMnl0IHsmohZShIVXOw6p0taOBoSaKTtdNKiG26CHBQJh4jtjovrm9TFJmLWVWRjBEQcqj6jpz
 e2aA064Hc+jWXs8L2LPmtaLVxN5Q4FEyg2J2bo27nfAbbKACJTYF5oiiSKjH/HOvLyj3GCMRcY9
 n4/wNifBgR+ZM8G7Na/xwX1sFnXejXXy9N7WuEp/kaFTqrzb/X1NWkuB/q3pR5fWqcTE/GNa3Uk
 a5d8FLBVnp7CmQxTf9Q==
X-Proofpoint-GUID: jvY478rENUjwj3EYLffIInVh4byJqwFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

Describe the LCDB block providing the LCD bias rails. Leave empty
regulator nodes, forcing board files to provide correct voltage.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 3911d6d0d2e2..8d2136d165b1 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -141,5 +141,19 @@ pm8150l_wled: leds@d800 {
 
 			status = "disabled";
 		};
+
+		pm8150l_lcdb: regulator@ec00 {
+			compatible = "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pm8150l_lcdb_ldo: ldo {
+			};
+
+			pm8150l_lcdb_ncp: ncp {
+			};
+		};
 	};
 };

-- 
2.47.3

