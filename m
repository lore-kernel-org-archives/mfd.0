Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E752606D
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421492; cv=none; b=fI7DDzNzG0XVjZTj9JBtB7IOBLniMJ/hIj3TCrCc7Ih+djwhwZENgoihfWc5srDG0OFIggruV4IzDyGbzk6gWIXexf9BTlyWLbp2uKeGgJLfJx0nlFSsetoI+jz0eb6hhKcKc+igEKtx1C5O8tcl2cKTodFeb8NsRqFazzy2igI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421492; c=relaxed/simple;
	bh=zvVlRGPfV18YCPCiwYSoInnOl8u2eP57S5CcXqMx7/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U18y+d/gPIEbRsqIJUo+jvWFiEceSDVuxgcUpkzdOBGRNwhs4gOh5n3LhiJANkI/8lej2lMy2anrTxolLqATE3EnKgVMa3kJ2+M7jVFEyWQGYCiFp+rXPgZGMHyVgq/ppqFxAYs7Cy1fLrc46U/fsrVwE0oRK4hD1EfMNNcRdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPhx03yE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zbxeyjpa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPhx03yE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zbxeyjpa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0AvF3989995
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=; b=hPhx03yEApUtS2Cr
	G/mnu/lPHF8i7R5Xbh2U5J5RZyxLTdfI3aSP/kgAhP6l9orDBuTvcv94G8GyFQ1a
	lIduw304YqkY0Di5O58pQ9+hgU0fkY7kJWGti+yvui94zphx/B4AoO5/4F+Y/XKa
	DkTC9ZiIX7VMWKFTH1fkjDAgvklQqz8N3HOkDg73nAFOJSLZhdY42bDIHSryHwKl
	5al8zVCFVssTXigjEO5Gx389G9Dz03w+2TTlpcec0bnnMoBLPfKsALuYIPqnWXIh
	16B+vGNJWo03AxL8/ENT8e2+KpIl3tU6YjzL6JHNzGl/5Ck9VI4URkFmWWDarHGw
	2MZcqA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f9qpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:51:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso3568021cf.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421489; x=1793026289; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=;
        b=ZbxeyjpaHWhLLgWOzKRQMlfdyJA4HlBDzuhxR0Snyfi7FNfipwXgAFSH9iKCT8Y538
         pi78DcvDtbFFWnvZpDUVfAk+nEALMOR8t8TFff62xicVw9gwADsnVTENqLFzMYP8poJR
         6CWI5DY1fjrB0D7EcKJTwahnIiXLJJ5abfg1+ya3XG9GExu9WRXm95dkM1GzF8oTVJCX
         MKLn4GjQCEX5XDpMoA42Tkn068so9rMreGpqPuWq8AbqK/WSmMkT5xuIakD9S15ZacH2
         LffSeVUEwbQoj0W02y6Q6Rf9HdHQD/nxxQ5WRAvieLo7h7GCdNGuTvkBQmRwIH/BYysa
         LQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421489; x=1793026289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=;
        b=x29OuA9wmfqvBAIYPTYNq/MlXC3S0Y+HvDrDSjaB5uJey4UQfSfSh6TEmoD5V8nCJS
         3UxhnAt4DsxhttruE+Ds2ttQmjGKZiqDais9G4l/R5ybr8Pfm2FJ5jR9F1GUe1wFN9v6
         +YijFw/KzObcTbhlpyhpYpvSdSjPqrguMbKML5Bz6rBb8ZSgr/3VSw+VbF9TNQFF+6qh
         l5T4yNxIQ78diUjt8/QG8TfAPwinuSkfJXeW7CgofPdM9jzRR3kA9E5BLUyQcf7ijqeT
         buyppqFcCPJTMJEijhvtZ14v/tViRxH8n7sEt9j3Xww8dX8yJAM7znLtWfloQSsQ8Osf
         YfsA==
X-Forwarded-Encrypted: i=1; AKwUvBwFks3fuVvYvSTBg/e0RvSAOv9bj5AdQqfwdm9R1UzctwEderbkntlt/BU1AEkBkhJRAVM=@lists.linux.dev
X-Gm-Message-State: AFq9FYIxyVGd5atu0/RClkeTQj/K8dPFYHzYh31PE9o8xMQDHllx76p2
	oiC2kv7Pr+ogKWYW1vgTIQRMjNSiDeITX1Ppi8UD+78MXd7fLAMPd173/3Y24IJBMTe2zbIOARp
	hI5CihYXNk0BU9whcUT6rh7XKQefaXuTSi9h5kz279ye4wTElT5xqRJg=
X-Gm-Gg: AYBFou22qmVvYMM0VmYfCoGVo2eQnMbBARvL/RbQNqvnKshVIoztrn8kgQzg5DA4Ngt
	M4W/4SLnNAyjm48HZyq0KvxhJhRV/HPGsFQU3ifFDsePg3gbnAypdJMWD/HcsrCJGWrkYjn41f6
	h71egRNGjF3EebGFlqXh+L8msqdSPp7/dn46pK+gWb+pCO5Dscv+XI5DQI5ZlddutnuLKJLpXU8
	RkAJFWuhTYTXEK7WF7yra621jcTbeWXFTX9V3NI427K9m+n8bTa/3uZfwp76eqZK05C6ZrLiC3z
	ez0Y1t22VZ7ySPKJ++rvSyd+GnERWAMxJgGGMjs+6CvdotS7t/R0DBgxUIt1Dh41arsqLJC4A3Z
	tDznma6OZJiRjOJfyx8aNYQ==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr197677985a.5.1792421489219;
        Mon, 19 Oct 2026 07:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr197672985a.5.1792421488554;
        Mon, 19 Oct 2026 07:51:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380856366b.11.2026.10.19.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:51:27 -0700 (PDT)
Message-ID: <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:51:24 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
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
 <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lxE41oHusZtyn7Nc3H_nb0I8yINuRcb9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX9i/Jejl+vmmL
 EZV4SlqTVZycw/QrjcefmCfC4I3Tm0Z0Vwxn096cOoFLRU224CYlDagcsznHsw/e35C2u8gLYCB
 y8HfKSlXcjmJNwBhenQltwoCpfTzi2M/6FVQYrAL48A/C5ZhyupbOYf3y+wqzUd68LJJEu074H1
 fZDGzwGY9sYoV5qGj0vktu22xnD+noqM+szsC8H7QEcchh2Xr3Dnlb1wMAw2cNT/qKbKIdFt0kT
 +yUVscL7wW15MC5unVEHabn3+qvxemag76FD7qpxSR9r79IClaHnYfKig0V/sFq1JlrJuT/Ozzx
 CbWilp60Yd5xpfGbPKYUrmsDux8Fge/pO0gI3heguL8o9b7PJI4E/WzyLTIjyQ2ubDMRiI4hna5
 BdoHgOLKAuW6U5F6E05J7bVus7BLvMP+5CZCtfNWlngNwendgRHCnIlsBf340zD+kDeeIxlTehx
 sUGCH7Sz965YBqCgDvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX0+P/P+sw8TpP
 RXvRIGBAgAa4kYtWW7CKiYWsjHZQmxTpmAAUXH6r/0aTF7f2v9N24YN9uK3rpK5emxhZ2WI68f6
 /840+lR4VBymLYp7ejg7q+yOYgmuTC8=
X-Proofpoint-GUID: lxE41oHusZtyn7Nc3H_nb0I8yINuRcb9
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad62e72 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-LKvvtDxBJcjZvG-X40A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> @@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
>  
>  		status = "disabled";
>  
> +		sensor@4700 {

Is it not there on the 4 other SMB2360s?

Konrad

> +			compatible = "qcom,smb2360-bcl";
> +			reg = <0x4700>;
> +			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		smb2360_0_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2360-eusb2-repeater";
>  			reg = <0xfd00>;
> 
