Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD74E8DF0
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409174; cv=none; b=QPLkRAcdsbxjWqXZ4t2bIPSn/qTSrMqxIVz3s7N/r3aEgu6m6DJuYDi9xqLvWzsreClSTitrUXSmkr1tAuW/uQRG2tggWUzxecVC2q8BeI01Z2+8FmGpWWWVNXq1zRGe+A/ZdbPFJtqB6Anen1KQhdK2GT4AX3NVSvNqJPQmpv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409174; c=relaxed/simple;
	bh=hZXX7jXb2RW5ococNqZ/3EvKgahehke65kVnEWQpEVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6IGUvMjbao5bQ1aRd0bznyEqfyusou/xOZyyAifHBGprRinqUeq4nTz13dDg1rY+OLdLKOzx8sYGedLRdfGfxAtF3MF25Sa5RvraGuNp0DtQMCxych2BfK2QDm34hCae1eY7kgH2uaCHFhyniRga/JHUhrfqZTRiiGpqGzzPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/spyE1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNmdP6Bf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/spyE1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNmdP6Bf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YrlI2688933
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ux49o/jZ2Q2HbyoLdTvVFEFeUH/9erwewqJgn0+nyII=; b=n/spyE1BkM/dDNRS
	NY8H3e9GZWT/a38lAPzY0ca12xZUFDWI7HgjNpvO99UkGI3Yc8Z4pi/6EasE8jSo
	MCirDZ1mGsx9tSwXtsaADw7Zw0SBJG6SnztTUifIANPCOiqMUrGtGY06QAjWHc7L
	KL7EEUBaSqvQA621soHLUt5j1vyfPzwayskQAksXU7qRalhgpIZfWAUm+p5lVhgb
	bBWO9Mjyjl9c/f75WXflinVfx8pxF9sfztA/nruxXhl6fuZZvAewQMIwizkM68xz
	kRy1cca41BQFoZlF18ZCFOVpbH+l+77b6bI2XJUVWYJJ7eKNg7Y+fe7vp7Nu1pSa
	SAogtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0mw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:26:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so434299785a.2
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409161; x=1793013961; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ux49o/jZ2Q2HbyoLdTvVFEFeUH/9erwewqJgn0+nyII=;
        b=dNmdP6BfMMeOfnu00F6ZfoYrEQYVvmdXgwu+5YOdZeZMB3nu3JAMuj2f806rdvB1NQ
         h/IsU80fFdXTUH/u806aWc2cIbLyW9YtIAx4WVZsCE4fCCrwTR6BMSwp6EQW0kph4SZx
         BNLXnD6VCue89iMf2eEGVuQrd3cMG2o+fgmg0c6L9wvV5Eo3E4ztR5yvX42JyXJk1b1I
         ox14/e8OkehokMOXMM6D949NTD+BvplBqGED4VQxsDOPulN7m0jpCoYvsQaL+sdQRAUj
         ANq7UBmsITviFa0kenistOBch2H4xpU5d3FzjwCKw8cec5aatCoDc1EId4EpebaNojHm
         utPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409161; x=1793013961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ux49o/jZ2Q2HbyoLdTvVFEFeUH/9erwewqJgn0+nyII=;
        b=TXp7cNhRRyKgHN6EYEgpgy3Bim11oLUjE4JEVvdPpGENrS5JVc1NZCykfbXjF18XET
         4D0yOCUVlCNd+81Vdpb/RLk0IyaC5wYKZfEwDjQ/d9RezGmQu7SXM8eNddYxVAkV63vC
         mmD1LhXpX6joeaPZ2xyPFYnfSXfS9F9HJoQNCF5AQI3V89ObR1DoiL56TX43p02WNI0V
         S2csDhUNRVRMPQzt9OYbhBzTz+cxIeoi2uHw5T/+oH7WslOQ1kf4omPuk4FZEf8hWNVP
         Q5z/OusZJfpppD4JC2/sRlrlb80ehuCragKQRLQYnhMSDwgHrhtZsnffJlXySRRsjm5T
         yeCg==
X-Forwarded-Encrypted: i=1; AKwUvBz0twUbzEC+XQMkg7s1jq+15dux4cas+lX/jkFvbgwgmJ0jxZzr8HNMcdtDNPNkt5caNTg=@lists.linux.dev
X-Gm-Message-State: AFq9FYIe4XT8/tblclfFGhVwg4W09XUdNwkTwbBCFeAMdPG+5avpornl
	gvcm1Z+8pEcmLCK+EYoQdzRtvthvqRwAj/TtzuFCmoyc194MPmT8KHFBtDH2vf5RY9s8oLpfEES
	NMqFK7JRHrcHXzxUjqBuVQ8MXMgcSswPJaeVsdRZvHiKhJA9wPX+5PmU=
X-Gm-Gg: AYBFou2OOGwjDfMT0PYthDXkQa5RWvkow1yPu9j0H+NQbBcjUQToJ+YSTsTwewPnqtN
	Hea4+2b8mVbQZpaxVP3qMtMM1tMRYrlZTjTKeXSZpMZ3ZRU2kYIpHenJ2bNgvmoz0BV4B+SvHZv
	kp/qMNuxURtMFdLyVzd2xI4Hj5f+66mheBrSBMFthMgp04poS+SCqnIl2XFEliGRBzr2U+u/OdC
	C7Bq2f3BvwrIUTGzab1OZ/C9CN8V1FYmZ3Va2+D0vfxMIHOvFlwM/G+EMcxY0yX4M70RlGdaLe8
	U3xVOcBPTRsxPJ7lj8ShaQTqR6PkTevf8Mowy/wrbq6a7/X5kZ88NC0gwKafxoUKNz4mPb0hsac
	T2RoEzhJwu8FBDjIHzZJyYNxFQ1nqW84ZkXL0f5VBaYPosyuBlmIZdoCWR7mOLHD6qDUKQunLv6
	0jInWbDJkyHK+e
X-Received: by 2002:a05:620a:45a5:b0:93e:5247:f61e with SMTP id af79cd13be357-93f29c949bamr1190123685a.25.1792409160807;
        Mon, 19 Oct 2026 04:26:00 -0700 (PDT)
X-Received: by 2002:a05:620a:45a5:b0:93e:5247:f61e with SMTP id af79cd13be357-93f29c949bamr1190118385a.25.1792409160178;
        Mon, 19 Oct 2026 04:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:42 +0300
Subject: [PATCH v2 6/8] arm64: dts: qcom: sm8150: add MDSS reset
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-6-86c05068efc5@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=887;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hZXX7jXb2RW5ococNqZ/3EvKgahehke65kVnEWQpEVQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f46nwhQIKuE+nnIJbKsZpWQ74BHTOmmJUSF4
 oXddakZXaGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OgAKCRCLPIo+Aiko
 1eDTB/0ScjJc6nrAYJwlxb7Z4o6Z87s6Yf5G/e6VqlG9wGSwoHZKsaWFTq8kjhNE7Sg5QROx8Zk
 yo//8AcN6chcIry3PekMiptrAnechf08aNFLpoiwDLSWds5cpZ1Ac0PlfTgMy5e6PR6FojkDbQY
 +TuLhxym4W4JiVAlCA/Q1SUNEuPcgYYKK6Pd47dca7Xdv4m76SCLdQXRENCr76zjt8gGEtHRRiV
 UIW+VuDyWoxJIkIvPPdxCMQdQo7sQOyJaNJWrjgm83pIEeqW5b5WLhCoJ7x/gLOoz17emmyFZB7
 rUupLGHhAHpKnnl7FuAWVMUC187kmAE5M0Nzk9EeN/bc0XfR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX/BHuEfHSBtrL
 FnGSNFRxhV3k8Cp1Yzq3UBQ/wKb4FakAo4nb3g7Z5dSzcOIZT+45uoKDtONaecORyX01B1OUetW
 D1lT1zkIhB80DVPoAwQphQA+NqYtbJc=
X-Proofpoint-GUID: BIaQmJ3HIofAaU6K9K-SMqpU46i7JWWy
X-Proofpoint-ORIG-GUID: BIaQmJ3HIofAaU6K9K-SMqpU46i7JWWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX5WYtcSG1coAe
 U8mTdk7oIoLXo3ViGyEyDs67/p75BmFkmbSJis/KxorvdByzWO5IJ1S6e8szZID6uwDz76BMgUg
 QoNSew//9UsG3b18/wEQupOd8DhfGgKeTmU43dlRC0bD1YxpNNG8x+nwjJKJp8gylhp/cUXb6st
 WiCyU3XAM8LGRW8f8BvXDvfnwduJgY5/UuplfdSA/Jd09DUw4xd74h5IlWENJbNu+2ZJyG++Lkh
 ECgycoDO6vupw+XR5XIBAF+eQOe+3ZX433hKE23WfWcXpbB0vOnbp+Q8q8/lscSOcX/XZZxGQFp
 ULFHNDUvS1C/R4/R5MfSvWv4wnwaA5VuQjtwcPFG3PuIC+E6JJb1XHcYUtftm554EnM50r/Ge2e
 ToftAAtG/26tqkFU8r4/3NjuF8eXdnmDeHkRj25RWb4MEA6D2JeYSjxDo5ykeEmZYZQQ+ChQmFB
 +Ho8fVfWTuKh70FbNpA==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5fe49 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Bz10KyuN3JYNdhx7gBUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190045

The bootloader can leave the display running, as it does on the SM8150
HDK with the display card attached. Describe the MDSS reset so that the
driver can bring the hardware into a known state before using it.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..a2d6e6947c4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
 
 			iommus = <&apps_smmu 0x800 0x420>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 			status = "disabled";
 
 			#address-cells = <2>;

-- 
2.47.3

