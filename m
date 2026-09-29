Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11EA524AF5
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687832; cv=none; b=GmL977Rh185znJMUCKT4EZs41unsVlokwCmaihcpkXL6U4Ql7IaEmYKakFAQjgkswhlI3xbNDOZu7Wr/wARjyjrAwz9eS83tFdSBMODpMSil7he4eDCNS3c4Jw9jreKV9mtSullPuzERXV6mrPVTNj6U0r2ZcO2738x3F6MKjNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687832; c=relaxed/simple;
	bh=DKWM8SY8JjCsjQcLdsu8gES1odRtwhgfY1WI0Sx22tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCMAQDIMqxozXV7W8BNH2V0oc6t/HVqOBZIhRH0p3wNaMtP+exbJPOY/IEVjqmIXs5lVDy41maXlt+dnxjvJ9VzcEfMHf7fvxhnJh9tAaUubNvrgk1YcnlioiIFnrK4ybHdnpGoM3nfkdruY6oI0n9BuhGhf0xGaYKxjx/oK/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA+t02bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4rvowls; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA+t02bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4rvowls"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw0pK3300928
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NVqNy8N/kAoNJkFDxNi1JrKf
	DmjV7xNsw6U2GUVyTV8=; b=aA+t02boDBtipwf1jH3x/YY2twAROOvzikyrzWxw
	4CWqKIfhFPJYCvRrn/ZE1bjF4rnkLoRfoHVI+iNPaBF7gR1Njgd7pKLEDnUUHl4O
	vHM+8dpRLnSPsNF+k9ybQf3ovnFWsgK7wtmXL8ZHxbXn0jC3s5xiqB9rou7zuSUC
	XMSOo5DVhWSk39DyA5UtL+uaTyjzIhHRYc10f2070eH7Bp8FMiOCYMflsHZKOB9V
	W7wPP9Edj7PfTKjCmahQxcmSOKSImY4G1rZav9Sa36CSO/S7mmzUK6cKWKaTB3vb
	srWRxAXfTcSb+zyxmEjMJ7pD6bI/x8+kdn+VCAChZY/RaA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx038j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:17:09 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-986ea272f77so268177241.0
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687829; x=1791292629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVqNy8N/kAoNJkFDxNi1JrKfDmjV7xNsw6U2GUVyTV8=;
        b=N4rvowlsLjyCrdchMM6c5uA3kl/3xG9EFBncUemfZl8kIvX+m+IBGtv/G0xj3Ji2Zc
         ofv8cD1cJqb3aog7ZuaDc0b4npjJv0Xf+/lqpFz70nLyjb9zho86QvD4sgNk9fhF2YWL
         YcJbGGiLzY5ToUuP1PpxNfG5j0CNdLxs+ffvsvhwtpbG45UKBOQ0SY18T1lpKfAHsBl4
         oAF+W8kApVKuWWHGa3RW6sPyY3m6HyjY/P34xnLDQZQDOhKNI0mq1HFJivefqUJVQzG9
         USaCjkd8HzgQIhQSEWdI4cy1qFwIk+yGMijY2oTBMHF4oTEMZerxYmA49bDlyRfr8ygs
         Hh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687829; x=1791292629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVqNy8N/kAoNJkFDxNi1JrKfDmjV7xNsw6U2GUVyTV8=;
        b=ztzeoXjFSZyFiltVYJg9ScYu9Ng9bRo+o529b//7nwJtc53pHyPnVDir8BxgroQYBs
         3ne/Hj/Fv09Qxfc7Gs32fccSyqslfNgsbzsJBS+SXqrbzVFecSJmTI0MntKdZgYNm2uP
         z8vbJN9utckblP7DdWCPgGizSi1h80sFAzbcrEhm4wV9zhB5jfxAQPIhwFKYMPzUz5ZL
         q3zOR/1hccwc5Fmv2fkZMNnNyHi8IRrGXPvRcXab1iIVk0xA1RaF6hmJr15PwzsOBhP4
         f5bmDdCHcjS2tEnpmH9XbOyXoCp+KUQWLcODjpgn3R1yiiOQCWXFkCfrqdso8B5/eelq
         BmXA==
X-Forwarded-Encrypted: i=1; AKwUvBxgVUDVqUnvjE5xWJXWkWA5ZrgPBz4H0jAOTECYOXe1vpp/F7uwDZtZyoVRObZfNsEqZLw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ7PgQb27P5DCeY0wURJf615pLtqZdGFMskcGN2L/2qRATSYTRd
	c/lB2rCr3ifMUqA+KGkP0fZ7wDUmBG1iy/kDp76Qx1yqpd8vrWnk8mcC4pS1L39Av1t5sg95dnu
	NPIN7zPdsp11aCL8srEn56s109FyAWvdPZb8cYFXZlUtqiyFYSzAWb2s=
X-Gm-Gg: AYBFou0YAHrngl+oae0UOFBzWlpfQsAORyjPlmvAGt09tI6CsL5mk0YeFNJAjVcZicA
	R9PUEO3ce9LRWdL26c0qbO2HMCynBC+2madM75KN/Dct8vlR52p6874HT4er/kI13pDZY2EtS2t
	mhvG1XLxNCPOsPq72rudXto6MnrrqVKzxaTKcv4CjpUiHjF3vQgve0EEl407b/Vvp3VWPVDseDJ
	l4y0iHMIUhDs4E8pUdqc4wXbw/x1qBFbDnmhZL018v+I6oAHjO6bW03atH5ytQ8OltazclrMi/6
	YHsBI639Mf/mIj7wnT06g/iPDaVstF9rWTBfHuVYoLJ6RltNEt2Jd9boIK4AeUvjIpe1ZnoNAZf
	QedDSZYLr5nwftf4=
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7b1b34d3523mr3489157137.0.1790687828853;
        Tue, 29 Sep 2026 06:17:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7b1b34d3523mr3489137137.0.1790687828182;
        Tue, 29 Sep 2026 06:17:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013b8f6f5sm10587355e9.10.2026.09.29.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:17:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:05 +0300
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
Subject: Re: [PATCH v3 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Message-ID: <gsod6i4ywwgugsu2matyz25ypdvjz4kddzddxf7atsqaet5r37@66lpgdpejq5p>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXy8e9vy7xmrJJ
 RN5YxrVaRQhQvgX9zZ/yMSfNFmdTeAYKCpnp2wr1eJlkMBmZeTmGMCDrrEM+UQOz5bKGa2APk0L
 Kn0g6DX4MO/oO20HMeLui7qs6vhUSuuwigiZS1VDTCntlC2tb6guajzhYIxlTZ5jaKHdCBMWZy/
 01wh7yrDy7WgfIWfxgCm/pZadM5ohPHtmMHw38wD+8QE71QPeMlxOkcMwFndvcjOkr0M8E0lPjD
 BNCc83ZTje1tV48RsyVCc1BMXVJFsogwZv59JbuQQUtr3aBioIq83QdggEyGcd0L+Tmly8CPYhE
 Tx98cMGCM0DBwRz0n1B3jZpRmYaQGtGqGTJ/iPD4RLZG7X49202cesU8j4ZV10hpJvEkyj5RSzA
 U6QCA179r6572UsYRShTdPpYVjI+SocuJ4EDqDptJgeECQrBvDmQwHdrvCmiibPgh6hvhsmryIc
 tPAlryM+stwZIlTFmuA==
X-Proofpoint-ORIG-GUID: mU2hXPFClWDJV2P70BV7nx2vdhDBkDBR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3PXtp/lqM4Ou
 +wO5qptQEnxdr0pXdvDu+wOxOhQl7rN6sldzfkohOUo2ZlwfwGPMU4nGlCZoZZFHzDamDWUAT7p
 EZzXtqNJ7zG25VqVXiQZnpsVJOk0QGo=
X-Proofpoint-GUID: mU2hXPFClWDJV2P70BV7nx2vdhDBkDBR
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbba55 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-LKvvtDxBJcjZvG-X40A:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:35, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
