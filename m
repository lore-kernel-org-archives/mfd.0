Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421642;
	b=sDybfiY0+jNjtK/NszjbmDDCx72wsWzApIjYmNE3vsA2vInPaJHSci8VYjj4eAe6Yt8A
	 uvbV8Z5c2THLwhWP+VtscO/kuaQlWnoJw4bc+e3dJQa39+UGyR9czJzLcQmQrFC2rU/DO
	 I3/03XW9v59fQyTizmZnv9oPhnTti0+NTEhPsB2oXYfO0aD9QyqEwnlhVExPuzFsKgCUm
	 XFWW8OZSGrDtnisAulophC79csXThdb5gFj+ywuQJIpfrUEEic65Nblnw/mD6dckDm8lo
	 JVbtqtGGaPSVCep6UzUkkQIzwPo5Yf+jc0QBbvF2p9Rt1z6RXYjaT/K9LD3vvy+UV1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421642;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
	b=Unw8lBVVUazGjX0XlmGDPHjL1p/WoOvEm50e624IKmu8FdyP5VBq8gCkgj6xUVzLgwbS
	 rp1B2G9zpMMEbrAR3ehv4hCVWPDiM6qJY5UN7YSZ1RJNzHtP4aDrhY6S+Pcf5X1p+YQmU
	 6cxrZ48kAsHFTlVd/mgBkSv0FRTeA/N5gaTRM1A3BkbE8MEJQ9Z9jQzWEwo3s1cVgLS6t
	 BexWeNnUqJSkLfFhxwEofow3b2TAETo8q7dQDTw9XDIFhvWTMqb+Gs8TyzK6LAwXkrFiW
	 DjK0Z2pj2niO4IeXbTtOa4/D9O7qw+F/6FzcUYcXSBDygs+vihZEfFl3WRgEia1Qcrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSiK6FH0;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71412606C174
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSiK6FH0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5C84C4613
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421642; cv=none; b=THNNSabb9CzV/A/IYh3d1697fr06L2dac4OxkRZCBcK4iZCKAxpPkufAhN5bw96Bw53V/w6ZPWJNXEJ5JJG0yOJDdsL23HJnRpbdqgfJoRge6G+bey8l7m7JPhuPjYpr53L+l2xETPf3EGJ0+y/GNEwuOTNHKHHnfStyGrZq9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421642; c=relaxed/simple;
	bh=iTgrOGbnyKTihKA/yOPRSWcSu2GJAEs2AInH7inLQ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5yTkl4czzF8GTmCdN7OETpt4saZe2hu2F24n3mOYUG3TWvF4Sgzz4vSh6ClOgYfG8XQse3OVrb1/Wq1BoJngMeoM8bvzYAv5dnhl+JT74cfFsdQmSBhqTV9a4XuSJM7YYAy2GAav41RFgDoaONNOL5O0NEpTMtw8QWhjwG58Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDzs1drh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSiK6FH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0fRB1904049
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=; b=JDzs1drhI+XmFFj7
	A4+OLzDU4EJ3oOZ9o/jS+ZurSZEMV8nm3p4AfKzDQwCSY9Ifcb307NYxWEV/ov8E
	F5cITVq1QE0dPN2paRQMgTBlOlAgYDG4OtcZ7J7wz29LDE6muDYl6QYKT2K2k5vz
	BfrrBy4xTwNvRWgmIpFmrSPRspLtq9eLPOsLEHZH6YjOzqqA9JA/O6WFssI4xJZ/
	aE66fi/08ND7CQ+y3z7ihVJw0ZNoNATb0D041Mydw0qX9ydRXxHUilr2rEgpKbTW
	18n7TedrdF4IbsulGl39gtRf9kA0TGUvLI+kgfFOJsmx4+3c6zrSf7l1DqpTQ9cA
	Ah7IhQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9qkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:53:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bf35c4c78so3447096d6.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421639; x=1793026439; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=hSiK6FH0vC1xF23T39bI5ZkBud4BrRMl4iYK0LyJtqwdiAZ/iOVSyOZQGWakZgN6cF
         MDuFwsGvlmymQLT/bpRi4cZlEH7DV6EXaR24GyuxVJ0FTb+Ay3ZSKSKgT5Jp8bOj6LqW
         Q4TjQ/jyhcrfZeOV4VHS4p/hZ9es3Sg4hCnC4lUiH2/UhkYIbqoUnmDk/0i7OqqWMYVB
         jOQUha/QFGn+5TUgIhBfqJ1Yiwl6SYO+c3Kgx8CVeQuk1fB59rFLnPK0EEmx6Fzqf1ne
         5IGdZ5EJq2Zll5a9RYKFDchWUnj09/8LiG7kihuwXN0wVB7TC+aFsy/6GX8U2a/VsiwP
         zMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421639; x=1793026439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=prHh2bNST3z8ZeWz8VhT3kZ4+lFSc4fAFA95G/XiCNLseLGnCv7dt2Qw7riGq/bLTl
         AMbIH8izpZowjyFHVvGcCiNFsmDPfWY+G0CaDjyfK6LQKQvENgNwmygUQrHArFh43JFG
         r8KDFTX4jd0WuXLknzaijRGNDVALXAxIQW4wyrtAIN1K9+9hUaKg87q5ezr4v80wGlOy
         /aC4kog7Xq7Pf76mP0YFkGdm6hSQCztOFPxcKkpD/45i0Q97mIwHpZe+qQ+2AkSxVVho
         Z5//ol7MBp9BxIRCNE2BXMadYWpjfbyJmstm53C/h+Dd76rC5QGZK2ElSoDJ0ARvmuC8
         iIDg==
X-Forwarded-Encrypted: i=1; AKwUvBzjn5FYFMlp7Tl5dym9jlN3yIizwOJx2Xf4fkH2CNJUiSNt4fAQkolQYOU4tyRhjidKFyo=@lists.linux.dev
X-Gm-Message-State: AFq9FYL/aCctm4CY2098ZkANWkt4QSfmh945Jwhcp/Cpy3OLvE4iKfsF
	YKlSigm6sXeE16CJaV7SKV2gKd7CQCU7E5NikTBFLGpcqIHsivIC2rvvc+fzyfhOsMM1aGw4BwL
	DX8zYxiSFt2ELCl/C43GrnvnPh7TSWB7yK9F0TLisWHOVwyilFyKkc6w=
X-Gm-Gg: AYBFou0+vVUbf+OqOHFw4OoJdzTVWcIJHu/Mt86jXwm4EUusaORuC1vDf4G9CY78AOL
	Y7SHCzXnMUPGq/CwIOJP+gFftSeSOXSh3hoK4jXQAvGOoFQirB+lyXtFOk154c7bvO+AXkYjtLO
	Th4Mx2rHbxHAXXNhSaR1srmEyKwhbxYtVSh9YfwecvRsrlmUJ4RhNTrEQqX5DTeBJmwwVYlLxGn
	tl+1ESk8HcTMUn1IgpzGLHQMPKz/O8omHPjHmhXN0NrIA2ycl5EcM4Op/Z1vKXHIahTLlwQMbHD
	Qg70/biIN2Uk/c3Masc0uKLjdXq1Pqq4FZ5w10vvGkMn1c5wEG2CFOQWyAyLXo11KXkkUXLKZKs
	EA/fOrIeMNVdTKKw03gcsNA==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529446985a.3.1792421638773;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529439185a.3.1792421638223;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c7ff2sm4047490a12.19.2026.10.19.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:57 -0700 (PDT)
Message-ID: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:54 +0200
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
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX8+9IB8l01NFa
 Y47N+8fkH9DqxUaoilBxzNibmuPkhpfxMcNTGqh/r3nLy8GQ9f7P3n448S6GDZ7WMIjKWc5YCFk
 eYYPkbO60epHxphBLCMjki46qO7LIQA=
X-Proofpoint-ORIG-GUID: RWUqeE8O4fHUuWEvhffZzwk6EzMenoDq
X-Proofpoint-GUID: RWUqeE8O4fHUuWEvhffZzwk6EzMenoDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXyGI/UZ1Wiehs
 TFu3WedeWfThaNM7CCr+6iY3zQqN6QKJHFIv+7JQEJWbG2qJTWWhikDkgDrgUZPL52R9wYegumh
 j0a/Dk1YFA9XSUgrA07QDeg9p8lnC8racamibbE/9sWLx0/kWpvvYPL6OQnN+lKaTnItQ6QqOIi
 pnpmDYDgEBYcqPsPOD50mt/UdBANFsrliW+RmlQ5k5SwSJpTKjHO2clWTEfRu67OvyaFXaadgX6
 i2M+EcBAa4/kN/KUpyvlh9N8zaa04DQhxQ4Tnuj6wESHsrOPO4lRy9bk8u4ESedD/ct7n2kjTE7
 YlKHCwGaNED8+cLvBhJoap99VhIuAwL3NkO9K/gKmcLhgHG/Qc0kHdWkKfdcsq4fleBaoenNptP
 w6oKhWMqf0ktq7XhI1eXiTeZruKwu+JnAfEx/QwiWdivWDgmkplRXnMS91J6JHBvB8ahXIEdK+4
 hrnsCN3gPxLIUaecLTQ==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62f07 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=55-3qADWK09jOtsAc_IA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---


>  arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> index 1e02578e4ee3..4809b3d8cfe2 100644
> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		sensor@4700 {
> +			compatible = "qcom,smb2370-bcl";

Like on Hamoa, why just one instance?

Konrad

> +			reg = <0x4700>;
> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2370-eusb2-repeater";
>  			reg = <0xfd00>;
> 
