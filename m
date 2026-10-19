Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693315AE438
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421551; cv=none; b=WJN28il13CwVkoqBNbDK5L1E1AUxg9rh6fqSkoUGWZreRK4kKbmhV3BOCLuP/ZvjI9PEJ8m/9T+MvaQb/xSfwj79fX7HQ2YqyzVLRp1QSnrLdNh2gqMvOvYydaKuirjTuU13D4D8CsuU3W7z/oF9KQQM0CsncD3uEsLPaEjYVGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421551; c=relaxed/simple;
	bh=1K5H105kxuN+ZVKT6leBzx4HfbQpcRrSq0RyZndHnM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgAn8EHCRNkZqqw1LHJPKetQFiBpkr+Vuxp0SBi/H9TdO28+/35MPLcX2AyNE6TrSAx2TUERTjrWbpWNwXn/hc1aQdMqUqzwSzWCrtkKhjdpXT/r7pcKT7r/dAY/DdxQaH4NWJ7jkDzQWRM1yZ8uetsCBxPsZue89d9Nc5R3sZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcj4Pdhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQZ0HgaZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcj4Pdhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQZ0HgaZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Cqi2971016
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=; b=bcj4PdhbvwkmQAwO
	asgKt1TDvUmcXWN6CUn2RC4pNw/poL4hDAAc//4xFP6t4HMQwYLiyVGlRkNg88u6
	IN0YTl/lfyBbes3BBjo16WuQGXYLHG3ZWB58d8uzu3j5M41WR/FlRQkXHTfKuW7X
	aeoG7seNQzShQ4PomUdkeR1Vj2PXqizfentckUQh+4ml/2pCy8/J3GWptU9f7n3J
	bVFb51EvsNlj6eIA1j0OVWt7wSgYXCByyP3Wex5TRK4PrYvY3qF8ghH891pMBZ1L
	NU64Aakiune2ofifbHeZ/wAi4rjSWkaWbw1mNiiIN4IAIan65qhY4LCpjlAwvAIh
	PFXPug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x9s60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so2975151cf.3
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421548; x=1793026348; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=;
        b=gQZ0HgaZrVVcytbIOJXQ1U3NhKALGkQOIu3G9GxPm0iyVb+b/9D5OLVmV0dXd6SJ9x
         4lvYgrDpVL/ac4IGhbt6ly3XqeMJ1R89maikM+oVL9axby55a/3ZP8kbuev0NVUiuEyI
         qsLrwHtjKq0AYu++ZJTghJ1cW5R7q23OrLS/bK4pfbSoKFhE6RtTgfQyhfBbBf6BqhIm
         AnC/kTzDXdldP/pPTMU8QQbyXHVT5x8DAzP8OPMb66Srgz+CrWotEK+awZOY3cMxx7Pn
         RVLdKMVlg5J9I7wd5DNVRWAMgjaX7uuYEpTQa/oXot+Dk8OTHs7Tdev5ybntWR2G5jvK
         d1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421548; x=1793026348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=;
        b=oV/yYE5lScpMK1QfVJpP85scuuagUd86ayL/2usMZ5VdUiQeUcZkPIdp2EBH5gXTPV
         tYVOxSADM1hZg1oSyIlYLmhssj/gfLGnd39M2zTqBeMeSUx/weWdqy6YPYaYLwQr/dOp
         V6AagRdDZxNAsEOGTbqWxiJ02nanMt0dsemewtRrDMkTs5sUHYpPG6PPv/pR4ZrWDK6Q
         /VPnwUpCE9cMCq7f2LqKSWn1Qc8G4fiFoa0iij9eIFuNNRGk5EcQ4pHvfH5/XB9qhe0b
         B++caoEj/+Q4WPxiP1pI8hrZVSyqPVGi/kSwzKUarB7trtOPmrs6FmAr7RoO8caZm6GR
         p0Yw==
X-Forwarded-Encrypted: i=1; AKwUvBx38aVDf+Q+Eb0Sz0ykTJUuiW0SyQNbM0bUuVw9/0/jqLamiLCS8HkpPUXDzeIX+wYVYds=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9TlXtOd9R6wfuREg07OpB7aeeSgDBmuVkwJ7BQbACSqUHpbr+
	etboDOLdwCIFyhRdro4XPJgB6eOkFFhiuV/bxDevbJdBlafqQGDnpcjB1aWplFgnMwkb5TA9Ang
	UXnTkq/Fc6Q/PCoV7FKqwTCLMe4ms7r2EPKOsEd8ORjEsrawSMJWF0+E=
X-Gm-Gg: AYBFou3HJjycqblV6cOClC0+j+mSPtMsC7Pkn1CwU0CS9kGHH5LR7MNVl6EnUZITYB3
	9LH9cL1VQSynu2AqqFcaLrMkis9mkW7jzkGXGCgCs5a2B12qkFlOW5iHDOvdcJ79LSjCZ/DC7F+
	yvrxrOjrPtaI1O+Ofqf50fR52u10+6gXq/n0oVpHA89gPZgnRW7TU2pUxg8gxEIpOTdB4RkXu/7
	knZuO4K983Fx9ALe0eQwFKttutNAaw6somxSg7F8iD+B/2JAuVN+ujD5G9UYpJtMHEyzBjLoe7m
	+iKccYndqS/onhPDxuV1mR05GWREpml/tPYIGhbLA48XbV3vHZcsBZwPOK6ygOqrhEJpZJQkags
	ykcGD2qk4Ow9PkrrT7YYU8g==
X-Received: by 2002:a05:620a:40d2:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f299e5cf2mr1473239485a.0.1792421547787;
        Mon, 19 Oct 2026 07:52:27 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f299e5cf2mr1473233085a.0.1792421547217;
        Mon, 19 Oct 2026 07:52:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf335sm373853966b.29.2026.10.19.07.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:26 -0700 (PDT)
Message-ID: <2aea5502-d9ae-4df1-abbb-9c5ae812b80a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:23 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
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
 <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0KCRMMasBoRKQJqx5TO6R5NkgYujQ_jI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX30LkxP7xF3hH
 bxuuIHhqL523iF9okTR7dSLRHhJLgd2wLsI9wy3MVeYDNktkJ46+rEm+/hSgaPAr+IVxeL4Mw9N
 EMegnP7BjzS0zxzAjZCk0QhdAVf7Txs=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad62eac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0KCRMMasBoRKQJqx5TO6R5NkgYujQ_jI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX7OY9qK7p0XtD
 CYPaR0/hg+xe+jaURM4jRBTabcAdXM7nMmndD+2eKA+URmAeX+IUxUm14xWMKwuIbd/gmkM0ujD
 9yN7hn2GmGiFUXry2H5/ImtJOmS4oR4jGExULvJXjzjOvDt5u0jKT+TRd92qSVTpyx6Xcb8eJWq
 gnoKCsdVv/gVuvNSmLJ1TsmUtmqYGuq31SdbIQMRVurcqjX+Z3sEyQqC45WzSMhh648MfNJsqsW
 yc8Sl0CrpRI9BUsiMBb3MtF+0ToEb52ROup6YqWBTa2fQ+6qyRWucDsKJGTzhZLsQaAGolTIVpL
 /24yFkbBodx0d00bewDCuAQHBhREjGSVwd7VymJoj1v7yyaiOBLT8t8+oteZB9s4DpnqnzOENQy
 h6MQEzLgnIt9/hvetNVFt0OJzsC8VusmUf5cKJgeQ1Wnq8XWKgQMng5VjqrDn7ad1NZAuy+7fPj
 56Ggh50cqpyCm22RJ2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
