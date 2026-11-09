Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237134;
	b=dsAg2TZSAj086PMtoyR2Y4Zw62MphQ5fjMrgOjdbrkpayU9EP8I3Q9fId0HiDI+dSlNg
	 cyXHOTdjp6Bxtz0ySWj2UItKzQ8QNxaf/XgIqanPwCocl7tpdq+d1rDErFYiU8qcUGbTM
	 XpobGv7lfoVUY8G1DG2scaQpCGmFjvXwwBbI6YU3Gov93gu0kV2iXS7dRpPn5xIalI11n
	 MziJJcfpU3GLn3+yThIxMCDxcpltPuB6X2ijoMqkUPNIj+YcTjbWmfl8SLoiwuO5afaj/
	 7TosQGKOXwlsaCjvGeqbKaaw53Z8XpXM/1MTOsEcf1w/yRWlxU/bUbbqpQvyBOq3meA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
	b=f/q3mu4ZYc+n4wOyQA16B/PlW13+f8LlcoKc2aK37uuTGrN//uaDQ0Zf1qAH0btSZJhL
	 ffKtaiiFwH5FXChhuJp2UTIg7lekQn4UyKtOdqLNHq9FBWao5qb1kQZDiVjqzk3U1uyw6
	 YNPERnqGmW1hrf518rBPD0PSDDVTlrsML3QFXUavlSQZH1cHfXznX3jow9ijstAYCjzgr
	 ZR9SsYnq6NCWmaotxUziVHoku2iKIKj3AtenhTzZ2O9LxSL6Sian6/RZFnsX4YnaSRmbg
	 AfWiTCP8EiVCzpV3v8ecIiIYrMUClvj6YZiXeBFE83I9iYP+707ADgSym858tE7oGow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bd9rwNYh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634CF606A325
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 15:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bd9rwNYh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF8bj1323361
	for <mfd@lists.linux.dev>; Mon, 9 Nov 2026 15:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=; b=JVHA+WmS28WTu51A
	alo4QMvr0WoiXI1XjKsBEXyVuK1q94o60sR1tEhkiY2tviOamIxSXbW2e4SvWI0B
	FTkucu81+2EXGVGJ5suaNaLkGLtqVzxKWtq5ruWvOOwNBDZI8/88FOsPRUA5JBHv
	JACpPjvZIITH3FJcqZnm9Bm/J0R+cyiE6IYGLJFK8oO7l309Hp1OjCX0HhYMm7Po
	btMjZ1ALCHvtYmQq86wiBt9nEtv5ydZzL5OQA1dARTOb2/BpGIxuc2TxWsSA0U8s
	SRIa4+tiSHSiIPRLKDBLsxrgw25FmtzCpVrDJlCpin4RqaRpkTqQZu+KTy5h/1ec
	MSZ0kw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qrkd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 15:12:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2cabc2086so17672137.3
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237133; x=1794841933; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=bd9rwNYhL247vgVcAtZV23IgykpJYWpGEmflvmgWtog33UTFDEusKiywxz4jpD2Udi
         gnCVENHkgDgZ/8lpLAdHqS/7dn3mzjWNIcV/2hpW2KXEb9LHZW/ZZnt6HZ/ZEqs9/ne+
         vw91/gbrIV0HmQRXO1I/r1Y7WpU/5Ys5Rqk/3ZIITEimMQbX9VhJ3hdznOGQCJex2T00
         wBwGsT++qdUBCxsxSEO6r+p0ZiVfD3w36XrqgtlbC5oj1N5mCKvisLWLy6ImUke0i3JW
         80OZvCQJt8YFnZCpHVxzKkWfEsMnhjA3YDyfJPt7OUy4ugkyynrdwZuvgnq0O/gi51hC
         4LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237133; x=1794841933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=es2ZazgBWYnhJbvhPtu3CkzXpKxNAjLIHGHoyeGAJiHqFRwAwJXCYvmraVH0hRvY1g
         qEGKJI5Fd9KrjiWq3wAhMff0V9v4lUbAgXdS3i9rMuYHjVkzKr3QJ8UEZRYH1RUy0Nf+
         hSC/XTE7iAi/6vlZOUf+UbPrBNzskmuGS1VEQrWacy/ymY5G5+kGfBbQsE6mFjs9wHwb
         me+IJwPOygGnDdZHocb+lD5ksw+fGdvCWmmcsk7Eu+Y2DCq0mDyZUzhoinZO1qJd2NXD
         hTDXpDdy6payWr4bHu9DjyjPHsM/3gYFNwbAk6MJ0MU0Ld4UMgQHb2p6ExSOudajWUVT
         OgJA==
X-Forwarded-Encrypted: i=1; AL+hErGqfdzm2Fe1wb87DJClUB1FBeQuMPf3i+r315YSu2U4PpurF2g1gJIDH0W8jXIc4DwgBtE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9jxwDytNj2WR1nEcZCIDHcTT9+5gJq7J2U/TuWhOqMO+a6UGeU
	uruxALhozaQjYSHNIUWQuUwK1RJB35tKBExgg96lWwc3g0LkfgZObuNbEy29P6fJYIBUplkhemd
	Q6ti6fMmWJRR5f/VZOlpAVnYZYSqYSXb74U/+Kv9zDZvoicZGhSP7MPE=
X-Gm-Gg: AYBFou3fLhsaDAj+qOu7p0Yu7G0SGNGGSCh/YoOKi9lYc8Ow1U/5q/hNbVAXIjk1on0
	CTYkMC7OSFCBMu2Y0v5H9JAUGqjxRFBASflI0WtRIf6nKe+LRAk0h80WQDsxfBDW7i2gEt1Njeu
	0OUkGeSrU/jEMO8wyRpkfvIp7rZ8BGbor4MZWenNspBLEMXWqkibwZOU/2fex4/wYJt5DlwsYPB
	ejYtZLgdpFwfdfPTnVSzdJ0n7CEQLvd5ZEKYK9ZxXlrLyR6/piK7077gGkgE+BQJLCEzVxoVr2M
	YeR80mlg8GE1C/T1ZR5B+CwY2KZOhfBUe30uIQ/QrQU4E1P7EU90L6/5zs9l748Qww3bqTJQq1J
	S2fzxJvgQHRbtCCZn5Zt+dQ/Cn/6MfvWtL5QDZxjdbL2A6vqvHH3M8FJFfWTtse9UV6uihw==
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229125137.0.1794237132521;
        Mon, 09 Nov 2026 07:12:12 -0800 (PST)
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229073137.0.1794237131982;
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1765456a12.26.2026.11.09.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Message-ID: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:12:05 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX2zTqebspIby3
 CoS692c/ZSo6SPnQtwXDuNBLmNW6drwKOOXpH8t5RZe5iJvQDR8qfcihBkXpeVmyronPb1oHPVx
 uFtSwnrbmhK4JNlYtObOcEEp5N3fDN6RN4BFvKAnDrvqGchy6o6kmG4sP5YIIPQgskyCY0ZRr9R
 XQVnmrIizLowNv8Cd6Ivur2n02ujoZMShusTK+C5bpHmPLp3F8fpgX5MCGfddD337RhGCiInLoh
 4mdzuxFdHxwMxoGeS8W/2YZGnEfT+p/LckRj6DN+G+nu2KWM3Ypblnq4vosvjaxRPP+CPlqwx7H
 WZcXW4McDSBIytfTiVaeoi1J2HGdQiaX2uZZg6LIcjbNVF0bHgechmNMTAWTCKFmTKn7JsT+c0X
 mUqZaB2tgjzuc/BU5+VMPeQ0cmj7bbIOadTDOX/9J9/PjLp3ewwUGLztJw7OZtnB8kgurXSRyY0
 1hnTWLWu/k/3zQaMhKA==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1e2cd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=Xzw-RmQiYhs1fFvV6_MA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: aMOFquHqgBq23xO5-zns5-KFAgNzeJg1
X-Proofpoint-ORIG-GUID: aMOFquHqgBq23xO5-zns5-KFAgNzeJg1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXwBx7MM7N+ZGd
 AGFKKWZH4nxSwx/1Uy5gOifTFauoUxHZlI1z7LMvUVlBXyID8ID5bq0rfP+SwfgpCNg6DypwxWg
 GCtjYJF2blKvz+AFV7MvbIavslgdJM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]


> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;

Is there no superspeed / dp altmode in hardware?

Konrad
