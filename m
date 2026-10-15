Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D504457BA
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055718; cv=none; b=IvOH+zgzUqPukriFLL2jSOsFyblF4CJ30v9H7oXPR/efXRNcKqSM8iehWb+dVzl7T3b7XFVNh5ueQftXmxZFtRYNuhW0V1W+ddrZyh5/4WBBUNX61gkkLBVl/6FAhN67g4jjxwFBRUpIKWJxyTfyBkjKF7Jztbj3StaVwk+DdKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055718; c=relaxed/simple;
	bh=z+BWBGlvD7j43OYcW9UusO7ekWqnSZaJz9t8vXKA1yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loBxRUklCTL5SUNOARqKIsa7CgLHc9vo1Zjr9CTwVBlk4zLQOksLk/s4k81OD6acrqYgbWm5eEoHgb/KN1P0jryzhJ705Gtk1O8fheCF6OE78HBHJo21XJLAm8E9WukmaIwVY+0i3pSnneLhU0BljAun7IH25VdjCrsuwIzZ3uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azbW2sya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNO4viyW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azbW2sya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNO4viyW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xbNm2738695
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=; b=azbW2syaIxiAklhX
	1zIMGP1og2e4iIi9ZHhc/SANhUraFuOr+/DGkSZWHbqw4LDmzlIxtiCbn/myzXNE
	Mom5KNaGtL2X2o/go7Lrvgp0g5WCf1wRU7ZyWkSwHwdU7BRv/B5NvgaAZJpjygav
	XaOdj+OUU1WD873tYIT/RfH13BFNfdwHuiGF9xmzJlx3GFqfrd6r1xBrIJOgFAQ6
	pD9CtFp7+OYdltJp/tR6hsxrOTnzvCiC3jBVd3yr0PHyz76iURhXVed63SB+9C68
	LuAm+6Zt6ZZ/qn76rPwrvVQm+Q3lMLonpHqTjcLaiqi7yAZR4FZHtxUIuxmpYMX8
	4gV/EQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds974t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:15:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338d5d0509so11032831cf.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055713; x=1792660513; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=;
        b=hNO4viyWGQ5sMn+xRbPJ3swQPl2Y26uOwXWpTygYwq6PBzFxGK5Zz9o/SOAIzMCxPX
         gpCjHmfAItYOgRgeSsLbI1oZNDMZtG8tSZDtWp7rHdI3gMSwIQXfTsbdws2sUqTrqnFZ
         NC7BFm2Rl6gNusO2K9GQAd0LEOIFNU9zbkxMiBygHQI5bTG8WpcuNVttiqtDYe/kthXS
         5XMOItu8E2yJbxFcaWvXI/JjWoa+zIHWSdiOgMtLA6dCou9DgSdKbL169e9ZFKm6QNj8
         9WtxCa5P5cDBIn1RIF0gD/k0TofinqdruVx7GAEQhbrM0U8rGINipLCCU6MoHqQfZYYi
         wyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055713; x=1792660513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=;
        b=C/gLn7s1m39UZNeQcLtiqLxYXPDi35qYeIyIAiDI410oOg6f6kXZVbJe+8K/z67s6H
         ZxgPKRspJIAwcKwY2UT3xRsNZxjkbCvBFmgg/OQhffdMsbtzlxPHfw4wyrE5p0Xx2kzO
         PAqtlJZNaE++vDsSTDBmWOHloZ4i3CgRmzuKVNKBkNjeGXK0Gt0gpOL4NrXOHZu0ZuNR
         sGUxX1p0/lxWL3/iz/lAHDavGLxF5E5VKtJXUgQb4sjj5/0U5QbAzhNLzJrylN73frVm
         gsD1vnckM2/Q8+gjh/H7+HYu2tIMa/tQTG2BnFzeXxLDhM7BLMni9zv4GRA3iKnBDFMy
         yU5g==
X-Forwarded-Encrypted: i=1; AKwUvBxZZGKyhHVI/082eZ6xKDY/0EbWqhokGSY6CEbJY6okBnJMZCgPym5naJ8BTJ3NFY6laSg=@lists.linux.dev
X-Gm-Message-State: AFq9FYIbbbPyXnFdIYHxxUcvlRIWhhZ9jiHBGrVif63RoHKE+OxCcRJq
	dfpfy8ZPg/2GFvuHvEGIg4ziuaQzpbqKFTs50Vsz0ch50E0nd/oPNYEA+0GZ2WPUb4fRg7cx/qd
	S32D2NHfESMRyOq3vvwIdo1iHj4lzXKhvze6JhE19t6Vhg1DIaqfZFGeHRyuYxGs=
X-Gm-Gg: AYBFou1tOueBSqT/EbwPIrMvTLLmu7rhpM6iM38g0MPSA/cK/EGqRNHgRsBjM82I7YO
	z6PciiIbfA5aEJ+/C6YO6kR683DknNt5A5xhuwkZ4V0ngoJyAs4f50ZP4gXSVtWXx9JIO18hLGa
	J6xT+jjUpQUgqOf5WXnc4tDo+8KbIdmMEUvRHFHIs06ccLL1HkDrXEoV104pdQL+AFLczEjvajB
	Vl3JG4n8b5sK3C5g4Us20GfSFH5Z5X1ui5KCVJDWEkhO78udV9VYwiT8brteO4pR0q4hr1yCsQR
	6bq3iM0acMlWAMePnTuczjIyneoCVr7w+o7XnnA2FpFs4eXkzpLGB2Fivu5XgydD4Yf+ydhRY8x
	wLbUseo0xHzNT3tu8TN+cbw==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3410266085a.6.1792055713577;
        Thu, 15 Oct 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3410260685a.6.1792055713032;
        Thu, 15 Oct 2026 02:15:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6f15sm101465966b.10.2026.10.15.02.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:15:11 -0700 (PDT)
Message-ID: <0e456ae9-7286-4c4f-b56b-9bbaf4076732@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:15:07 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
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
 <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bkizLLgdZFYIGzwzW6DW4gNRu1XEV8yi
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad099a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Jhhi1Yo89JosEC0CkA0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX4z/XaXdBhI1a
 u+OROxDvGODQKpkymt85NU8yxhXyuVthMmsWvBvb1KykAVw5oZK8LMXYL8ZhiOsmBcpvUAg81RR
 4E5UieUSqQ1ERT4cNHAydQTtdVFX+4Z51Lpmem/wzIDgacUy03qG6tvbBLw4gYj+6ncRhmt+HLH
 NiuUlZBUjrCugYGP8VU+DMyTSzsIF6OYJFvgjfJXJwbeDNDrzbV+NbLJdpUMaMSNlAJUG/h0IIz
 w5BYHbHR8Y4D1ruRV550ORrK5/PC+fA2LLPP+3ITmVjihwcc5ljq92dDyn9Ve5GmfFT5hWPRGWw
 ourxMDBHAc9tOHfC52gVMp9JT4QY1CruxI0K2qjwvOvs41ShyQGetYJy3LiTtIN+7Q1zTlKqSS5
 M0lhZQFSyKSsKUbM5ZUHhdgqycweLCWMyKlJHIjyQE86aTH3VHBElmIAsNjTRlec7rvu2qw7E5N
 HaZhfBKULjMN8CdgIxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX9j1PCfJM7Pib
 Acp5Nc5J7Cg2Ei73dckrPu8Smw0S9v64E6ZYUKYs0xiCCYU6ZkyRLWgbGKLMZ0+yETF88/Y+jDj
 9PD4JqAmon9PsCzz05K83jfNizw1HMI=
X-Proofpoint-GUID: bkizLLgdZFYIGzwzW6DW4gNRu1XEV8yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The bootloader can leave the display running, as it does on the SM8150
> HDK with the display card attached. Describe the MDSS reset so that the
> driver can bring the hardware into a known state before using it.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 293fcbacff34..a2d6e6947c4c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
>  
>  			iommus = <&apps_smmu 0x800 0x420>;
>  
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;

please put it under clocks like in other DTs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
