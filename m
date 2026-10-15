Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02D490C1F
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055445; cv=none; b=mfHyubAIHj4OpwY0izYnN+DIRKjr5LnXr0Mrci12Xh8/Icv06reAdWJOjTi0OjTW/BPylMQWITtCws8DKbYreEk/XQ1opkh4zsgwd3fWWX0oGx4nnN/Tqfcz6aOfm+/xYcdw0qh8IrOyvG7E5wpsn7rnGZFAcNEs0RYHeRjp9bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055445; c=relaxed/simple;
	bh=F9sCs/Et+Q8r2QxPlaxDRFhUFrobaL5SK4g9Bng5fxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxUN7Vf5IFvSz9weIFSS8jRVvIwqEhkSAU3paeY3NZUOJaJTEl1f9AY2c00jjgVcfN8B4iAxOU6ytQjvvjmUtOQYEJBDl+YF9HaZ2nJLtS1ZhSqv5UysgFwMmHXpYiNHeTaoJL7Ta031QLOqkBSkGbaxFEM1LpOuK4r65pai2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNXqNt3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUEfdojZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNXqNt3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUEfdojZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F765Ht1672232
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=; b=lNXqNt3tkE/p961B
	wahr3Lmhg1umEwgGeBlbKzdQD6+6DynIJcumsyW6FdgTDooOm3yrmyvioHialzms
	4apGwbfbo6HiiyUDj1e5uBpp1Ee4wERSV7RwMiy596LX/OmTC4reOEvy51vIHXm2
	ynGUNLCBTYitPT1RcFUlTqM5l49FExlq1TFFBc04dxFmK9M3f+1IbifZII0Ndiux
	taB/MRxOO7o9Jw/b3Xc8Z9JLQLWfZlV/p4OPfYk2qSS7vS6T+Z1CmYIydDcZsuvi
	KZ+71i0ZmtUzqvedLDcuCYCk2u96iDIPO76GTZpBlu/Kjvgj3KgXi7xQ2ui3/X44
	QLkjrg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbkbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:10:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179ef12a03so17125116d6.1
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055442; x=1792660242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=;
        b=HUEfdojZHyOfFZ856rXIFuok631XCpo3s3kaJVRbanOYkIfoRGCf6WJaOO/zQYUiWl
         BxD4EDebxQCYTT2m3rA2K8shYdyWYc/1xX/2jEJ7kWDAZmcnzSVnLH2Qzks36QapfRQQ
         AwfR1GS8ayZaE3RMM6PMgypl9+pRJhsXuUF1MbvwkI7k/Fr+lE2+oJGgvZLx4EOiB+9L
         e3l9dKAUxPKrqPgJ04VgGLdkY1XkjTf7GtCBcnG9IMduw7pSVRrUgSJ4msmsxqgGZgya
         KhyBHZnJ3C+EU4eU1UKLMYYy+HXajyzJu4GBRvn/TVQfyUywLzevznwg0mLf4WqAQm38
         +0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055442; x=1792660242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=;
        b=GTPV61skH3lxrjQC48qiblLBO/rrLn9viMZb5dhf6AGb8LH+aCW+7evgjMXWY6Z/OJ
         TRaOAIBYZLCIYGnlL9vTmCduvC0aTCWcgOf74J4PCRsIiBoTqCeMKyB/6AETzNUz+457
         pI0V0pE6jr9Q8gZiMN7Cw1cdADXbSGwBm8Q2xI7XsDXdCbmBnVquGBEUvLcm4wbn+Jrf
         gbwGT1MZOhgO232qpyO9AdzDRcEWonyvrlGCJNU69CWSKGHJn2CwH1UcttoRQbhipMz6
         FZ8KHYEXLDgDGN9Xey93ewBPWSdirFexDLVt30viVpa5zV8crJHsLJLvfWfVBt946ROY
         5M8w==
X-Forwarded-Encrypted: i=1; AKwUvBzKwa8mCT50GyAZ6lpi8IqEaNeB2z5nX40/sF7vnVsPEc8lEct+J+W0WItyC2v9p6jQvFQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKKRx/cZ4kfJ5rxpnTlgJkMfOoh+yt2e7qWRQXjBMDiy5BtUgCZ
	qOFvoUSMMSdvwpZvt7Gebc5GEfKADD3KWSKLyEunVz/wqPfy97BNdNkHTJUs02Xh5h8hf86RrzZ
	6hi9Yd0yvXYh+sZfnZmd6fWGGZ8D/cQPflLrQMDmkLtTg6tMMQN+fykk=
X-Gm-Gg: AYBFou1hVXREXjTAzvu5Yen+oNEItEQ8cVtex6NTAoGsOnoPJaW1VCCWQ/Vd2GhT23I
	l6A3CY+xpQWfwYkcEf5wUPNYrgQdrLjve1bPFAiUnfOVyeqeZXTe7dXMBoEwzjhQCIdaX3h5qPM
	wgR0S77erHCurhj7lAguZS9djCL7RFfkhunRuf37oi4+UHGEBM5blkcd3p4EucZIMjbd6yLSp/W
	JAQuged7D8NKiWI4Pfaswpx9Fy/1JthZ5lqcJpvmwlw/0ebkvwKSKxuM494D42TqvkRFQ9lPn3w
	UJswJ3PFoqppBTUMKCllnHmbpB77FGaeNvgGxTEmNwSg3jLI76SJApdiOkv2j2h0wzXV7K6ljHt
	YykKscBUL48xma4zNLIPlJA==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3641736685a.3.1792055442388;
        Thu, 15 Oct 2026 02:10:42 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3641732685a.3.1792055441898;
        Thu, 15 Oct 2026 02:10:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038abf24sm2188025a12.37.2026.10.15.02.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:10:40 -0700 (PDT)
Message-ID: <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:10:38 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
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
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OmDWDzxBLSSFAXt3nYW7pFw2_yjIuY8t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX9jMWFYFVMX/X
 FWQCVDDahr2/ib99NiOSbB4Dm5Bqz1mApVWDxmPoOGzDHeDjQElL3CQxcBMEPKpo2sfh7J/7SUA
 o6oWcLCzech59xIDxLAzzhoCSfGUkqg=
X-Proofpoint-GUID: OmDWDzxBLSSFAXt3nYW7pFw2_yjIuY8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX7n2OhUyy4PNv
 Tx24OCiH8Kpylp0Us/MipiiyeFZy2DGS0+m7Tzu9q6LyM0blN1yCeIMwBe4FTrXSq8czHEvxcN7
 2WZ4VrxAM+bPaoYQNZgVpHXSH+5m+8JnAxNf+7ukoq62OJnk4+kyM6dCf1KZ9LzXVhJrKA4QZmp
 Lm+fPZNinNevhPZ6WhCxoa7fF/bAd9Ln+p8QKCIH+4Et+PDFPcPr4h9KyfXMPrMLEIaDEPrhlnm
 lKMtFODNCL3139P4OoEj6eJvL26LiLnMUOnOt74yKmubrjGcvoc+yDzOtJ0FigYG0CAWmS/EbVQ
 mAn4SaR34+5YSnT6NdHkCIXNiSI+F0W89AM2ADZkKqdfiWwdk05AHd2Nz2e6jQ3d8HulG2ByjiX
 EHB491x29A+hw7PeX8HqSAiOmX4JZ+HlmLRcotVhvvCVzCnXg3jJcgw94Ya4gnBxALlxBH/Nr8r
 C0CSxAojf+IifaSDtkg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad09893 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7g7iOhDP9QsUep1Qju8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
> the wrong address the mux driver fails to probe, the Type-C controller
> and the DisplayPort controller keep waiting for it and the display
> subsystem never binds.
> 
> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
an earlier revision of the board which routed that differently or
something.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

