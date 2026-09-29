Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464A526A80
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688045; cv=none; b=mAN53hHBZBXmsJ75Knit3AQh+w3TouQUq5C9Ce4BqssqZeX8F8ArtUhAnfvsYJFDXLT5s7c+qGm/uQCybA/BXCujR4maqvBy35qLNnlT5ekD1inx87arxu/BeFVlKaKQCCyAxu9OOt1eUwu/7pdVMxfz+H2Obj/Dp716evOeZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688045; c=relaxed/simple;
	bh=O0ihVgcmW96N31WjaekfKFoFrDNfaoWUpnrojK/kPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTraayoq/w2Q1RkWbNx06CfTgaZdPv4W2eST68Yf7vq8FHFV2vfaSm3lMIobgmej6O0v+C1IZLpWR6zZZhx9zZCvHCGhggxZqecfC308YEmb2pnnlnXn11soDXiq1+qrYn7KhW2A3xCkPFT3tUrWJ/xRr3sV6OrtPxZa+2KTc7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+Uuq0gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zt4lj8FT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+Uuq0gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zt4lj8FT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCrYtW1479313
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2SaWLLt3k31dyNE7WFRzNl2
	f9XMQ7VloVYpaAtanfM=; b=V+Uuq0ghWlHXxC/cS6ZROX+vjP3BZfTZKEB0TEvj
	GcTNivb2V6exptb2l+M2RvdmxVPQjM4G+8QePtIZlZS34qs+k1zsEwFg2655uP2G
	xJA64+hFb9I4NN35uFhmb4y1KNhllDHTfdaoOQNl1MXLutbltgUoiNk38CIWnoPg
	+wvv6irWZrF5FleeP3Ao0ZVVNlF3KE5TsPFK5SjH1VBsV+hQSnrsi6O3vlBq9LaU
	mLIOE0kN9jMgyrfcHv9haPdsUQQke1m/eeVl0cm/ZG+T49bKC0H9X30oHZwctmNR
	BUG+ys8of2MACreFfhvVRivrrvd+qMV7nY2FjzVtgCSGlA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m7na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:20:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b7da952536so1627207137.3
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688042; x=1791292842; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=Zt4lj8FTkato0PUTpc+B1I+5B5gt6qK3h+rQzqU5A7qb0vtLPWBs+EAvSiYvsH2Smv
         B42smTJzs74UvV00J5FoIUbudlKf/ta/n0lMPNFUeGDc19rkd7ntXjH+VEFNsLKwzQkK
         cJZKHRFo1ewLAH/1dyrX6NP9TqkzDUvU4IQW6zaqpQxEUBwaDN2Wu+z1t2MD98TAPEHQ
         JrhsKlNFTN7Ei+YBv6NDwmigyUA6k6eWFb1IL1bZ5HWalv4xTRS1OVy/Fn5mFk748/T3
         fMlL9rqr/NfjZ8qaB8NooZ6RnPULiltMo+mA1SYdOQxhcm80i335GdbTyu82sqEVEEiv
         fLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688042; x=1791292842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=aYERcr/mSsc3dmLPwBHc0kBC2fvbc+/WzBsb6Grx7Siwnn7dpn/R9XigoSWMOBLsVG
         ystrfAC9Nd68Q2gTn2IQ1jcz7TaI5xxCNihD4cwFEZl2cBC0Ae5p74vpG9BX0tBWatMh
         BQCbGsAeuCiypd7c4A+HjacfWiFR1lwGQ8yhcE8m0VW1o4vKa9RSF6ouilXmPVamBtdy
         mXvKRdCoGS9l3xXEupLigtN8WW49xPJ+IvS2tmzEL7aiQERDY6w3FJgj7gshICM9UmYm
         m+zROuhLIA5yXwdEWz8pl1ZG0jh0GuMSC18mUgGmlnCvg37odxMH1WcNKgoiyDtxvkyJ
         rdmQ==
X-Forwarded-Encrypted: i=1; AKwUvByZYy3UtR8gm2ZhCygwWeM0ocB77z4KRomoeJDDz0awK0/HE6WGiVm8UTU9PNxXcuLsF5M=@lists.linux.dev
X-Gm-Message-State: AFq9FYLWU2PreNmRQNqv20nLwghLynMF4KfZAtL0cwSR0gJXswvn593k
	7N+MLM9uoIINktNdgDprCPSu+YFL7XPNIWpddGFnGDnIje9AQ2zs45lx3NqpacBgReQH6KucNIQ
	4zrYzN48SkhF8QBmDTBvksYDtQPju3Y+7tQu3SZQ9ezZtVnvicnT5gT4=
X-Gm-Gg: AYBFou1Dylc9FC1MhdsmoRwbmyy/bd4SMFuRN2UpAgmgPBBF6yIEHiDmbCkgFQA3A/8
	59gIqza/4gqM+KTGqCmgSICMqOP71YVYFitqtI3nVN+3zr9mBIUKdpT1cBqSmbQRA8unBk5XKyx
	+JuutpZtKFhbKdiNUsn5Vi8Qb/okBLdr2myggsVwiWrG7Eu14FLiAUZmMV+BMkgpXTmJhBUNaFW
	lWdEqQEj8slveCvUHrVmGpfycSOR+7brK7h66LEPHegjsSQnH3oMBRA9STuQ1vm77JFBDjozDJH
	8Q4YRXPInZjB6Gg8lRB3MbvKFnYsJLanoM4bXL14+lVy36BLkhqpmtwiVRYdV/BNWAvSvB31IXR
	+UkPcPADAAzohkww=
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr6061159137.32.1790688042217;
        Tue, 29 Sep 2026 06:20:42 -0700 (PDT)
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr6061142137.32.1790688041617;
        Tue, 29 Sep 2026 06:20:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm85417285e9.13.2026.09.29.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Message-ID: <bjtvryroi4ckhhlhllaarccyf34uxllmfqwt4jzchtrhwqnuub@7vuypzfxbf76>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX148F4p2IMc1w
 jo3SXXWnRPSKaqGTb1sEKt7gClPDp2D122SY8BF6LYg7/zIqviV+fGtZlaJXN/w2TCrxciWb8C7
 E7IM9JWUaD2xVh5fuUj+unE6U4EpQTo=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbbb2b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX/WWImQPGlLEQ
 4HuI1ROLSHLF4c1veST0+vDYTMZJgJvlrXmBZgYilF04ATxHTyKdotON6a1Gj68DBZ+Eos8pV9M
 ymE2Nt70lroB3Fon1GfSsNX2afEqWrbPcEfT/vJCrMA1sDHJxCSOrQpHZJIE0dfx8/AEzaHNAp1
 DklghytOIOrM8KI6HebneFdwyLkujkUQ5VCLzp+bBeUuhRE3YF70vYFUu5fA/nFcpUSLme6d3vH
 XswsLqlg02zjRCRz8Niuzau3SEYPbDvl7jtD5EoSR4zqraJhyb/veyvMhY2MhslgqkpCcCpXPJL
 s4NDSWndj6rO+caTZ478OucO0UUNs7zBeAREEoZ5mst+UKAGRuNO3It0o200Ym+q/SGxtxeE/OK
 bIT+D1pi1bGrRFnDLhW7jKwenPfzJBP6Z87F2r7B8q4UiPS4vm0xctW3bNLX2SUVQSJzETdhZuY
 SIybGxIqzc0FqfCFZNg==
X-Proofpoint-GUID: XlTvGvWZkewxj2FDTIiHhMuId4aJfc0i
X-Proofpoint-ORIG-GUID: XlTvGvWZkewxj2FDTIiHhMuId4aJfc0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:41, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
