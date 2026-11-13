Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576242;
	b=GZ27PywQe/nPEg+taRe58zmEnGdC8uegk07VpPSh17Av/tW/39fzDqBBTNPTZnXLuHIn
	 7oEPRg6MdAvn/OO55CbLffwhb6Yemup6z1bS0Ukc326R+5ot4xdpXicgRTaIxGCVD6Qes
	 Rr3X8x/rp0QzCH1+1H9Dy0p0wukrHOaJbeeHfm4NlMXyzN1YABm7bGVROnpbv0LEHJDxB
	 BFVJS7mpOsVZjg5e0697iIkV8SDq742lNB5vX76XNTkglxtlaqC7Fqse4OvFQEXAEuXce
	 XR1q3T4Y+jKum5PphA0LTl1TDQAjQsLwjl7W4t4s02Qfwyl1hq0DwmpRYA3N9yrLiRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
	b=KJx2TwsiK/wJeNokrjmUG6qHiwKCYemr0WUZ6LU5UDau2j9QLD8f300kZYUh2v1tOpHk
	 KNpNBDTxfXGn6IaoPQZIbqntz3MSZgl95/YY667Yldzq/qB2tFm/NU5uWt02rGGczNw6J
	 LdJ60+jdtXsMv8mVw2upBfTy7XFaqKnMkM/q0meYqqThr4XPbzOx4CW8xIzdxp/5A24GK
	 4w+9YRIyC0RmmU+rPS+MAT4t8HV+Z8elMwxdXSi1xWdsd2pdaWmv0Z14vrAvhlUkWtHsk
	 Zp/2emfyzF5UHp4G78vqxrksIwScTIZns/2ENj43GZMulJ4W6NEO9DVqqVmXa0bvpig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gSvbWoS8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RF0JzyW8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC6606A327
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 13:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BC6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gSvbWoS8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RF0JzyW8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJXEs3772417
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 13:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqQSzfa4X2q1eaOzzledzFWV
	9wSVN6Ii42fhCdUzIzM=; b=gSvbWoS8Oi2eyjt1WvdU1+Ub6y4YmzlIfZRc4cpx
	vSBQLHqz06je8f6hf/DLqfnFtBa+nMNxMCPecB7FR0JUDu947qCjlVhKa/WSpDBC
	7yIhzd9tnr9WKP+7x60+T7leBlgoAHz4CefbIwsy56O0zQ7xbdTX8dZ0Wcl/Sgrq
	YI5tlCu/aFC/T7FWfMnjCdg9Kbl1ZPrf6JQNOR+au6O7ior4Ay37H6ZirhOvtbCK
	yITIPAHxWYt8gJufiakwd4+Ujk8VTMSgmlKB8n7O8TB7b41LqLNyQHLehwKPrNA9
	LPoK/oWvaggNs7E6tWSFESq/4XlRfIpZ28Hx63LpwbPGTw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2msvue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 13:24:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ee0977403bso1377399e0c.0
        for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794576240; x=1795181040; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
        b=RF0JzyW8esT+jtZdcqyoSBSRnlzAICvgx4Z1HiKtxBFUC1ZPlJ/ao4kwI0B35HHP1A
         UHfxgP3q7s30dXU9pMLiOKLIrlXCxGyWneJ6A917+ed1lTDDzTV9efjX8XQI4aAdeIIX
         6R2vPC0Fiug+xxSRxxn9CuIBf2wOFujSeujITjuSczDrxithyrCtWSIyp48KXOA1Tnek
         /gQekqJVaBdO2lWZ1OKK9/zrrg3rVjN6SO3AI/bKGgWSiypYFzcLMprxvSEPq54cB+LE
         bfTc8LR7Ck9vbw4AHObWV5aursUjASlmOtkqzwc99Gkw3JrTqjCy0euxvDuSIh5AWuAp
         EXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576240; x=1795181040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqQSzfa4X2q1eaOzzledzFWV9wSVN6Ii42fhCdUzIzM=;
        b=XmOHE8BK46P+BD6G+qsp3L3wfFNdtdCnUY6AibbGJVwgonLRvcQHD9/3ccrPPATwyG
         rtaE4FkAAoTAAIkgi3EUwlbWCCUFOIiLAvnTah/7494RYqULF0imEmQTJ2cbZD65qurf
         VnqJiwzDV4e9LUf/ZKw++j5wffQYPT2cfJQ+JnftA7QnVSMSqz+ly2TihqNOkdVH1ZnI
         ezIODqeOJrOZ6ceyZFvG56yyY4sGPZv3gUbjbdKk4aImYE0E55KRxrmVENf5BKFlEG25
         sIjKzu/RqoaXfpjwZ1Y6eGGOXswQopEIGuDPe+itbBynuGPw0hQ5lqxrwbQbwCCN6Xh1
         EyHg==
X-Forwarded-Encrypted: i=1; AL+hErFtjZGjj/CjbyX/Miz+u9eG9wYgOi3tvNTVJxRClQfAQb+4dCwDwa8h486/yDd91cgZWwo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+cJZxVkQBxxU5vDEB6Cxf0jsy8frZywLeB0I8pW6A4wLBv3ffG
	29duIt2MbheDN9EvHW5CLutiIr0Jc5UGAzJhJUBDNToeouY/g7sdLs1v5yFP3JcarrwIhPQknGC
	HMGnL//YVVvne9zfAfj+oQo8cQ5ll1T0cXepix+ARd2MseEWwUGPZ/ns=
X-Gm-Gg: AYBFou0egrTRXh0tq4n1lgr1W19Wm7CT5TVC4srU4RhS2EHmJHKpS1gUVynOF3I1Y3N
	GVzCt8OB/9T8LyDdefcCnmkyYUZTpeKO72dcprt3eAJW1LlI3qgX41xQ9Biap4heSDCcjJ6be0P
	p5PLeWxziUqvEBwZ/2k4GX+u5jcj0AgYBaW+WLiNBxYApRzbjdvPy4IjAvMNOVkBkzyRPXw5UQw
	piESSLNwf1pJmI5AD5KzMlDN6bjcmiEEf48HQuxPuWdnZh4APHGLNjdhUZliuuOUrtXmMXYN5/N
	SmkHZZ2gPX825SSeROkkSZ6Zvpm5MCiYAzUG+cmR5IY06bWrhVcJwcb/LlRgz/rb1agSln375n7
	HRUNIMqOjM4lMzriEj9uLqO57a4WL3SsUtX+x/AH4zh0OXTZAkTWUeLNsHh/0Av7YVHrLTz772a
	jOWLIXlRum2GCvtRnaHmOWCZ8RcuyWOCqwFSoxuNPOQ664BkETZioKkqS28vtVtQ==
X-Received: by 2002:a05:6122:c84:b0:5ec:d5e1:ee47 with SMTP id 71dfb90a1353d-5ee34a46714mr861536e0c.5.1794576239769;
        Fri, 13 Nov 2026 05:23:59 -0800 (PST)
X-Received: by 2002:a05:6122:c84:b0:5ec:d5e1:ee47 with SMTP id 71dfb90a1353d-5ee34a46714mr861522e0c.5.1794576239222;
        Fri, 13 Nov 2026 05:23:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9f7esm747180e87.12.2026.11.13.05.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:23:58 -0800 (PST)
Date: Fri, 13 Nov 2026 15:23:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add MSM8996 SAW3 syscon compatible
Message-ID: <wy654rwebljpfzii6liwqhebk4vuohlskhp66g45fwei6zwtj5@kc3k4enc6s6e>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
X-Proofpoint-ORIG-GUID: G_qIczVNXSucQ_gE99lP1TTMwUuoCvpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX28snjKVtCfAW
 8B4cUporfwgY8nAngWrBJFUho3mFt0Z8WuIFUvY9WMdWKGtq82g9Qi0sOkOY0PpKQesXr5GWBD6
 Sr9v+jYQ9ZijwDwYyohftFfVVPQv+HSL9LPo2u/8emFswKJ5Cno1sjIW2b59oW2PwbNg2+Y4LsD
 +CRjO3o3aThiJm7zfQLfaiVplEXSUSajOIn6mvUdte0qnGbHNNXqxo3eV7El6BLCw6Mg3fYrYXP
 upYPSzH66Hd7TTDtG3K32cDx3fh6vnCLEVyyvBPg0Gr79eojTQmudVIdA6VXeA+xroTx57pD0KT
 HK6F1U/dWn7gPFrgyu9VPDUKafab/RzS2zhxFilBv8YzDU6am3Qrf9KG/hJdBeSLIeAFm/rh/UL
 6R0RbvSreMxFmQd+npX1amu84ajnSRwkfqBn/TFhgF0vZIrpFZ1U8ySWX/wm8Do3+9bnlT8uOVs
 ABWiSwRrTq4utQX1Pqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX8ttWJmGqQ1zc
 vY9+EslOBPQRDhDRUz8cIPItUo5cuvND5sMGOifXjPOj10+z10Z5O8tmxswnj/QVAeNjrIPkark
 hFFyLFVVGIAK+E7D3PLb5PxSL5ZxcaA=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af70f70 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=9GAwKLooXcChzj6GhEEA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: G_qIczVNXSucQ_gE99lP1TTMwUuoCvpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130053

On Thu, Nov 12, 2026 at 02:26:40PM -0600, Rob Herring (Arm) wrote:
> 'syscon' nodes are required to have specific compatibles. Add
> "qcom,msm8996-saw3" compatible to the MSM8996 SAW3 syscon block.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 1267c56d586b..4e8eb82420e2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3793,7 +3793,7 @@ frame@98c0000 {
>  		};
>  
>  		saw3: syscon@9a10000 {
> -			compatible = "syscon";
> +			compatible = "qcom,msm8996-saw3", "syscon";

Can we please follow the rest of the SAW devices? Rob, would you please
change it to qcom,msm8996-saw3-cbf or qcom,msm8996-saw3-v1.0-cbf? There
are other SAW blocks on MSM8996 platforms (which are being controlled by
the firmware on the devices we support upstream, phones with older
firmware might need to name and control them).

>  			reg = <0x09a10000 0x1000>;
>  		};
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
