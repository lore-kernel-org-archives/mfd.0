Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421602;
	b=S12hN/6ZmsrvedOL0m+P3zaJI2KEDm3dsTJP/puEg8DlN8R9/qt4ApG42mQYKR4+PIBA
	 MkFz+gSo5ktBILfvT0ndN8denusu6pEBT+fZUMzJaUXiu0hOPcoabdpQKxaAg8jVRrKy/
	 iN03B/ueOMlvAs/eEHR6F3ewyB2l1GLdVJC27xInRF68C/1CFblc47AQ22l+8i59iIYTn
	 5cgzk1a9exAIWSMQOPRVEPwz8bPRCFloxJzNIuf3Qo8aEm43FJ7ZKUvWWam/MptSkvs8b
	 eiok+FnvEa1LzQqYmUTnr7LwtIwljrNbThCMPoWzx7JKCLCiENtHMMKSzsFwfm2xoXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421602;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
	b=Gg915lkx4cj8o6LDxXbzGM2OrW408ru781XPoGNw/aUeRaP7/oCgdGd7f9li4LzbmMlf
	 05mglTLQWvnc+MwdP+7aecs9jNuiuosNQA0KyBLSGvwHkBvU8hie35fXeBeRzr5x2ZUxQ
	 rqxoZ7tKTtYtkXSgEf2Qfu4Ruqd9XxLK3vVYOqlAOi0JjxWwuU97YdWhvtdtfqjgxiJLh
	 OX5/C+8eCNQDHVu8wl9Bc4EtWXhBqJsT1vWOp5JewBhTfPty0GcFZwTo0LK+tKXBwe0PF
	 ju/OQTeTXzNFJhkXjBcx2UiNMjhWBOztkGUe4hvbEn+tkcYUk42NBAO+DdzAyE6JUDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cXYZb/nZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AMOHEMuz;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16926606AAE7
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXYZb/nZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AMOHEMuz
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AEE3451CE
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421602; cv=none; b=M1YrSf2QBFLwj+QhB8N7UGWHGSknFLWZHr7S8OhSBr/IxOgTv1m7sfj54RaPT822lUptET678ohv6BvI2xTgoJXjFl4wrNG3lmgNmTdNe1gSTfivNoHTwTX3gnPuRf9PKo7ViX9y++Z0NugPF1tZLBy90BV9RMY2hQthAbGwWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421602; c=relaxed/simple;
	bh=VUJcuiGWrc/VTOU1ddPCEZGdzHccyfbVYcukszE+EZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9480tZxR66ofjIEMA/H5t2joNyM2e3pAapWQsom2Xi/lxgdOr1gWHP8AxR0XkypqK/SPrtzTsHHg7Fz6kRDWwf4k460q3XRpKSWUiHbWSF+NJRNMZ7b7jKR7NHmvR1DoWmE/X/2W+Bzj/EtOIdHrB6DKnmH9f5yvAwyI0IXB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXYZb/nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMOHEMuz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0D6D2628816
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=; b=cXYZb/nZKZ0bU1h6
	1XNLExxGiATo/yC39BDOred/ABS9YYZHO1ffkSyZ+l6NBFihi0Iyqpfjrd/o4ukv
	l9NZGKcGfgemARpS0sBG0RSt/fiH93EBBbHgu0i5HTF1k+4zhEIh823EfZvSL98r
	vEHbp3rpO+JIyykJ7xNI94k1tfmDCV6THP9EqkzNR1KWiwN6VBNuc/AiAtjLy4gJ
	2VXpD5PI+f2pD0JcUR3mCHACkmj6y5if5C0AccwZAQjpYUsQ+c75QjP98ex+2059
	ylZoB4Lg214OTqW0gsodXtUQ/dQOBcAYcJ9LaO/8sX5TKMp0bzo7hPRj4wlgqexv
	ZjzYEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfgjg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so77839085a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421598; x=1793026398; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=AMOHEMuzIMcwGfC/EdGtqvryodwvt7uJwQTwC31emp8EraZAVaXY2sq5A1GaIYrbSn
         OmZnnZPUe6zzg/FqHF2WlPtj97P2A0uoBwImgcS5Q1Bl8qMSWgInoYGINLK8tcVHt801
         k30HPBPTDa0mHH9MRj7vDxxSREgroB3mcucew0C9QrpQUZjqzSYG+m73eK+nfm9WT7cV
         gPmZvvkjTjq58zLYIhcyIIALyK2FfJkGlYn5J6EOgK/DX3xWDbhiZfeqYrPsBvn1UbA9
         aMNAbS0i06JUVin57I2wAF/MvjmKPoSh49U07w6UHws3xoeO9pcTSk6j+vAqYPFqiiU4
         aN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421598; x=1793026398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=GpFJNRX77ZoSSMYlAetNpLf66OpLngye1et9vjIazLbEOMsCgjDt8iAMYYNNRIEW/w
         9M33e+chASOhHQLTmWF6RjOj6QP7FF0vdecda1PKEO9eLm7WMyvik/jjiHx1PvYByrF1
         cvng6H6qn8UBovGTSXhUAQiHA6e2TIAyRhOUSNuEnaBq46lKZYJ7zOFOUa8etOyzn+6/
         LznJga9dUO4kRgvpiXRe+LrITwaNxqLiIXa5JLTUljI57yTuc2urVxhm78ZttKA8ieqR
         44KX5iZJhDOB3LrGk3qKsVDd1K3sU+8SBe/lAGQNjSMNanL+tyxMCiCVb/SZS7Rkv35N
         OMnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZgjKkq+NgpTPMDPVw0OmH4emgcPnk/JXyqIlvIDkHKdONMrLNHwf3Bh5paGUpiMxqOkg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJNYWFdcizFdxGSKtJskWVC0aDcggx5c5QLy/0MoMhUqiuvHL3U
	5c5SAdjb57LL+ytVAMl7mbnV4GMX2Mks8m5ox4GU0ba+ETVwnzj656tZOv2snCsefXrIEjoop5c
	PE0qp78S3N2UzU1Tx5xARGKq6RbSuhL4RcjXVyF5AEMTSKgbeoJYU6nc=
X-Gm-Gg: AYBFou1iz82fdWpPt+5NLcAX6viaNs1C8EhgUMrZfk5dcmEw9+eYn4GFAUwBcZ/o5if
	ZmIDDaAA0G63dWw4/wUHlTLUDE1MlIjLuNrn/07WODsfqhTHXYjUMzlhMfya5z153oiAfdkiSnn
	ZCuoAq66WfiYLFR3Lqq5v9aDrAHDvCbepz9TV1MsFvYBq/TCk2w3RMCqV7bn5in1P9kMvBCz0UU
	bGEBKyx8FfvuWR7ziRZTPK38YASFIl61S5t4sGuzsbsM5/B7wcaXINIFqC0Y8x9+c/KPwN986v9
	y8+es7WTKMhX2/4C5O1WhdY4Mvd02+FH+Khbs+YWFH8HsfrDLw1a5wFu1oC/Srvx39RZfvi2ngs
	L43DpPK/8dMpl2fDX5VwpPA==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480030585a.4.1792421597820;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480025385a.4.1792421597304;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:16 -0700 (PDT)
Message-ID: <78fcb970-250a-4852-b514-8d3eabe535c0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:14 +0200
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
Subject: Re: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
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
 <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zi0iSAysEj4BnWlvFV_uPHAOScXWN0M4
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad62ede cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX5DuWijX+SufF
 /yPTu7plvf2H99JUqWguR6hv+bugedtbz8RJYCwLnONUNF9+spYuy8sf+dBWNXOEltT/Hqup6O9
 yThYl6vUb+Dik5lz9uWbva5k4I9zAu7UrA8PTuMmZGIZwD2L7GD/Uax1mIS5ApIVF4f6K2NFhkT
 G8dO6PHiepdAjixeceTMC157yrwNGODk6+eWzuX+FwpTu7cuM62bXyFmt4zkf1f/I62trr2qMQC
 sem5HV18RLwsdsTOnuCapUouqESyjmxsd99I5bvnk2+/CHjlIsTI1SXvRKm0iY9FGzsRRvFBTno
 93ZTY7iedG/ZnGkF8jJUYoIGwYkdQk1ciN8Op5gRdMo6fNLslUfYGhUxjjB2TiRdDGSU3M9Yfuv
 zws0xooF2u6l/bxzJem17Hm1dtJK1QJbbHpONmA4xt0zSzGEQyvlslxF2OOlkKvvmJFd/cXl5hr
 P99lsO1LbIvH+iMTFAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXwrwZNn6qxsu2
 dNUE213a3atBs/MpoN9mvRDmnTxUBnY0NUDzKQIp7uL+m8J6zu/mf5f/fcL+lX80jWAuMeHTS0s
 uB/beKFQ6SvZ8sOYNZS15FQViTVvv98=
X-Proofpoint-ORIG-GUID: Zi0iSAysEj4BnWlvFV_uPHAOScXWN0M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
