Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796138;
	b=l2OUw4Vo8NQY7F53IeNUXSuxhxu7/d1+G0RRspvT4g6j4T1/p2qHzsnIIxFUu111ah6M
	 Ch5lD7DNjf5ldaNlsLFZU4s0u11s/MGXvdLHrS4AOgXXdmUou1EzfPIC8GMkrAyE8elXg
	 iPe9TFzaMDu40Gi1Zfnrm2+YyybEag2Vy7eukTvoDRjIdxZPWsJ/HWYtXUma2hbkP34Qn
	 CgAVooKWt/M+jC78aYsNXRJOXVzz8vHajdfLK0iBLXyIUgjfy3pGwJfNmwRpnNEB3RjWP
	 XGmRqCVG5k99qCnqAQ5+RbmX8PArIpGy6RB0dOLqL8zsKB+N5CYg8g/L5DhH0lYe+3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
	b=10jSM2bOI985FiKnXsF5DaPY8JcvlO84GZuTdXuxMCyUXiBruVbqPl7fKWb5Omkt2zP9
	 Oc3PS2qZQoklhkYATo7BADTBn4lGSiNCLCyDTR3i9cWvmrdi/REl8sk3F+ylyAB6/nsaY
	 m/orSlVs/MGoeu1DhubbhmhFSLoeHP76mvCi0TiKI+BVFeM/qWagmC5VI+/oThQEB84aI
	 cOOXhv0xlQE9O6v4mdJt8rgnv7XdhtdOzhD/1DaKBodJrzzJvm36YnSwsNcG6kEbg1gLq
	 Eo1mNObqfES2Qh+D4kMxQxCu6+lSwvERHl62mYIp0kW4LK0FpADW3lAzbt6yvu8wb6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYAH41jD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9A606A329
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A9A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYAH41jD
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsNH2284175
	for <mfd@lists.linux.dev>; Wed, 4 Nov 2026 12:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=; b=UiT1E2wlC4LPns21
	26JaTaMG0ZJ88knZvaPJ1cjuUkiOUawIQ7KxFarPy69PPOKkCaXNAQlE0u7DIQuS
	UpVXFrJDfRDK5nJBxe7V+mme0U2o+LPtytdGCG+LAH7QTc4zoYX1d7oo0I0D2bl5
	EHt5jm4z9yNyAhMQiXS2NJ3sqcM2etlzI7kbRdUkgS6rJdz6+JFds1f/FtcOCTP8
	He4yS2TmDqblmBUI8hJhQ4PZCWVZitBT8Rv4QTidQwZj39euTYfhwYMazKwhe02E
	DPFkeAGSu7BlGqeJsN5H7bJMI6W7TnILGDT/OteKDH3uGvxZYGgBPIDxEsccreDh
	u5MkAw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284rpf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 12:42:16 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-70377b23231so319046eaf.2
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796136; x=1794400936; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=FYAH41jDqFOj051Ceq2IXkYNHJ6gEyeXlzEr8MtuFWarlaL5VhKupYuia2JSccMeK7
         4Oe8XeF2K6Fmr4Lm54vEBaBHjF+f/en5z92KitAvoIEwsfoxCWCj/Zssb9+meSQs6OUC
         RNTUAlg4tSmLOnnL93ytYkJ/BVsmMnJRE0284+V3q/dhtTZ89QlU1SpDaeHg44YI502z
         fZYbahaX4AZODqLfbVBmJPaRYW/fRLe31nR8Cb3Y9o4T4aQztENJk93LrlIxZEGvq0rp
         qgLcIDWRttUh+KvPUAW3nsXlF7f+7+vHOZqcgvK7sYFwZsifFNcDFAhw+K/KjRtL9fOw
         Ngyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796136; x=1794400936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=i5AO8FfVEcp00sgfMCt210AR08X2ICYQjHOl93+dPC4IpW7OQ3Xa3Br7btwuV1PuPS
         TtyA/x7RExg5by1ec+U3iigMXTLKCROMhN8ceF9fcUsGfNxb5UbI5YdhqaES+scGhYkS
         Xy8QWZHgqMzGkhQXmiTC2So/CjcaYVp3C9Sc87SrHQ0TeU0ME++FR+nwl/aVUsoTV76x
         +F2bbQde0r7YzVkhzn6fN1ACtUa5FeaKq2JzHA2kRMAYcC4QSGxG+qRMLDaBiSxqhCb4
         +79pkTWT+4kyzKixGSX0autNv9HQuznxly9Z153YaW/N6XAYI41QYTp30Mn9Pgvj+WUZ
         Ma2A==
X-Forwarded-Encrypted: i=1; AKwUvBzZSiA85n39YfuFDkhjkCD9374dvNDLaeBAzmKkEBjyc/4NeLp47f7C6pmrKQ5l2Y5G0PI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8VTf0kawq3m77GawdGP4ReUYzy+KWR7jHhGyYsGIIA9KZqbhx6
	bCkLSrJN2PXszccgmf6t1LvR87bJj9brZ2ifVxs4lS4lihldpv1ACIoLg+Azd708Be4eZC4Gqa7
	uxzftvPggxzS5AsEmkiWpuQkJKEOGzU76z0ZMU6GISf7ny2qPC6tLvJI=
X-Gm-Gg: AYBFou0QvKv4ez2fmItO/lbnx9e5J9Uy12H5Mc2D6s2pThZBDi94k9YfN2FQvY2fHuq
	kOmSYnGqaeCK4Mr13VSv0AJB+8RIdkZfHXMlaVLZmI18PlYuoAHkku1aoniNlt+UYcE2NGj9+wX
	aK3XphvS0dUgASyqUlt845GBR2xQMn88Yq7gwrddRfQd21wyrnrbctbJXYyCpd11Wx7daz9F1uv
	CqBXzzpaF/21PrTdXFvhPvlMR3kgFS9Oolhe5r+6TZhp9IIUfmf1pJ3plx+swYq+tN0nMho0PkH
	y8zzQeIeQ55rhDNCkya0Qd3bSzBAe+YRSVi6NtkDrU2Wn79tq95naV2zuFXxKhKw+WsHcygy0Gq
	91g7CEzSr2VlDTNyOoGNDEQdDeIgeCTFlw/wsXjwZGOP05lLI4+JZVqDSElBOa0oyRLQ3PqeO7G
	KsOODZwA==
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458505eaf.63.1793796136260;
        Wed, 04 Nov 2026 04:42:16 -0800 (PST)
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458498eaf.63.1793796135837;
        Wed, 04 Nov 2026 04:42:15 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm1497063eaf.13.2026.11.04.04.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:42:14 -0800 (PST)
Message-ID: <f9ff9954-8e80-470f-aedf-6dd415b0e1e4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:12:07 +0530
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
 <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb2828 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Uwc5bU2mXagv8lUGyjYA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: 2tQHgBfMMM5DjKstxOnr6tYQukn53MF3
X-Proofpoint-GUID: 2tQHgBfMMM5DjKstxOnr6tYQukn53MF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX8WPJsX28Qbev
 HlCO+YWxqNuVGE9ktRD0ijX0axDu8zkteJn/anEaykiWLaRMPJbDa4jzCWyTL43LA++InPzd3/h
 6VtsDp+EUKzQEjvY/Px2q6x50W29m/UiItnpN64IRKX4NOflFnqIyc4j82LPBSwmmiR8eMdnKig
 cpV8KHWoVAoCYNklh11XScCfgz0Tgs1/yoqvWdF1osWZDevweQhEEgCytf/6ee5RmxCulYSt7Oz
 9vpKBCRG596zdQt3/ONdmqryGDcql0vAE7vYqFoDkM8Gea5Pm3AmJGV2OJyEvHlyG3LVIIPwTvo
 HHIybgo/2Qq9vxM//dzoFC9sJOk8gnMj09QJww1p9YxwMPCxrFH03NMNzpV6wRXRx4U8OrFt1m8
 g4x8yGcMwHS3QQPwaMCfJCdI0gz/mZgcqRs8Hn+AzxdIS9zwuYj1F5ftWE+qbS3vWruCHnO1zb3
 6Bl+TiNHaf04BUTv2JQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX7suva7G9J2F+
 T9b4wg5e+WIbopq9zZAETiIiZrOVdLTYf1MEm+isWrFhCxkobqPB5KSCiU3DT06C6einBcgBWYd
 UPIdoZo/6gQWl1o7gX1ep2QLA2iL3pE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040050

Hi Konrad,

On 10/19/2026 8:23 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
>> PMIC. The BCL monitors battery voltage and current, providing hardware
>> interrupts when configurable thresholds are violated.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> 
>>   arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> index 1e02578e4ee3..4809b3d8cfe2 100644
>> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   
>> +		sensor@4700 {
>> +			compatible = "qcom,smb2370-bcl";
> 
> Like on Hamoa, why just one instance?

The BCL peripheral is enabled only on the first SMB2370.

Thanks,
Manaf

> 
> Konrad
> 
>> +			reg = <0x4700>;
>> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>>   			compatible = "qcom,smb2370-eusb2-repeater";
>>   			reg = <0xfd00>;
>>

