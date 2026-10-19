Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CE14E56F7
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409529; cv=none; b=kr0ToJDLUo7K0SVntegjh8lIBPC+LnkUSosd2fSq+gbXhckhpidjNtNjSy2EISk++MiR6gbsCn8cTCxm1jX+43mesTVbSbxULfdC/JLF2A43THz6SDbRHc1vKYJI1JDMhixAr+VE6UGXMEWcHPhc5/bxWv/SfebwyDfSv/HDiD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409529; c=relaxed/simple;
	bh=lwQQfEh9nOqhpblPlramWU10O82Qm2G3izaI5hHN9R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGpyBpWVJKYTdhXpoo2nuclqeMCs4YFr5/3PDk4ZIGDE5qpCKWQVDlbSQyw7feFb4VwYnJWrssQ+W4h9+3WHIDrXLa2A79xQ4O5/xAHp5WjDCCABFgM199H2mJuGw/82gr1XbbM6E52GbHv7YG40qsxWe2ewdjBK0ximwhEp6AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTDo3FLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWw3dDOj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTDo3FLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWw3dDOj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PDL72193399
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=; b=RTDo3FLrGhjc/gZy
	n9Glp4xGxq7EJQEmcX1CiiEZZxn9jiqfa6PgqNIScBlelsdwbI/OqFuP521zGQ24
	sPooiOe25IeGZvNevJlSmbfEBn3uP60wQcWomHSTfYosxV7WgnANn5YazYR4wCO/
	hwOcWMMaTHiZAMPdUdXZruWtjRujJhyks+dyQ0KvMnH7EQc4GTBEVJDHbWsUgmWI
	gU0QAVjU2any5x0K/exh2z4mCUoP1R/zW6MMJeWFSILCCAcAA+HMZ50SAvMnQjrN
	NbU7PqlKGXGPkCxB5ow1R920VeVDCryDIoWwoMPBWJ2UltbyoWArBcwDZRzsREsm
	e2qUow==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1ag19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:32:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaabe26601so49725e0c.2
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409526; x=1793014326; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=;
        b=WWw3dDOjmtw0JhQ7YL2vobRDY8oED4RROFTp/NzpKDGd7wRcS/wCjqEI8YzzHNcA2p
         AOuvZtVk9GcLc811QV+f71hZwt1+RTOO8AfQFABjlyQRrDA5rMpf7til/nYjEzrP57Yg
         +LBBn+9JiDH/PFAC7Pj0j5qARBfaSgBASjySO5QMzRJ51xaf0JMVVt2S+O58hQ2hbEcm
         jfYDzNanIDELNJWRFjdGCwIkin3Weq0sEweyVnBf+9kUu0Zcrg5kptrY9U7DejDKMEkL
         b3yr4K4ZT/8wEwGTzEfmJmRdi3HXJIYHVh3oIjj7TBGCAyWAxPnxoTSSM/bTSoYCTK99
         Kh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409526; x=1793014326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pohp5mV7y1QLZu3exMVa2FPIYN+bK5gJNyDuRfvMI3Q=;
        b=aOZr1AG1/zBOZGnO12ONd6ZVgx3vsvFVwRgGxSK4Ke4laixpIjOI+hnFmZcXu2F+Ht
         L4GH6nQqWNS2qF0V1dn2aWmZVYXbvvHtmShHJWUNsKd4sxjC2tE6R9KeK5+hH8bA2W5P
         bn93pCDOe4dhRcSrBqOcdgrsiq7TZxVTBDEEhR1aQPJHI0EDAZQk3jIJm+hHih7zuAP9
         ofSepuXamkMxCby9YZcYSsbrPc0S2CAOzsTcS8gVMlRtYbEkqoQ80R8QKDC5TFvRZU56
         70rjX+grzjqOceKD9uUuqbCiCTAhSi3nB0hPeTYLIirJx4XUpwMFTPsw4YKrNYEbhAWP
         oN+A==
X-Forwarded-Encrypted: i=1; AKwUvBzBuqtyUFev8JkxYtTKrAx4o5ncsPHX4qKSbysZHb5ZnwQqguIOQJm6/BmYSJ6iEQdeQWk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLz/vclUceGcdmkzsVkZCsRmMa+UvHX2IYvyWJqSdjwRJJbJQ+/
	yhlyGo00mh+MHIvWV3U+uXkT4icrT5Co2MQKIy0Qc59qIHRJ3c3BrA/mXOplBfcwqor0mrn+KMP
	MGibyh1hUjbiLbZ2VXRDtLFB0fPyEbP/Pt7VmZv3znt6S4q9LCwO401M=
X-Gm-Gg: AYBFou3hysg9B0PxN9XFeKfRVy//qkfuS81ZHMsdKsy5X2h487yz0sxDujUsx/mMN0Z
	2Ki38YJTrRNBU6eskgRUlJSNBFTq9EGNMZJpEOmrdQRxO0xWZWhRkH3jHJmxMlueS9lkcWXQMpt
	PNzh0iIV8nKRXHb2az+tQUfMM6N/BgGnv0oxrGWMgN9VpiB5rWKys23QNyEH6cKhbfH2mtj5xYo
	sHS5odEsZ2e+irBBd6Awmg+D2HOoB60//Qmbl1XpDqho7KYlPnZL39vhxFIxqW5E/1PGbMt2Yvb
	lKN6BHUu3jk64cZbizrzgxCfEaKZjG50B221q7zWa6DRY4Qx9GeNjKGB5gsyrE+RZi5IAPbuj3r
	8E265WYXrqMFZ8avy8NvvkQ==
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1277909137.3.1792409525971;
        Mon, 19 Oct 2026 04:32:05 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1277902137.3.1792409525489;
        Mon, 19 Oct 2026 04:32:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42554cf6cesm217763566b.36.2026.10.19.04.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:32:04 -0700 (PDT)
Message-ID: <e91eb6ff-1d7a-4295-ad57-02ca2bd10411@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:32:01 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] arm64: qcom: enable display card support on SM8150
 HDK
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
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX5ncB5tqz2Px7
 DU0RTAJbzTQNEA1Fximybq4w2bQzteK0PpvESb4u9PKnJ1AarYh2HXULaDr1YEegXzwTJOlHotx
 Z0brCeNB7mS25y4uOxiAxp+ZNaqJc3E=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5ffb6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rzYBljbM_JLXBvC404AA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX2Xx9coTrazgI
 hr/PNPNGO6PYMOS9wuEuXPSvneC8Q3ZjqsZGom9hv9yFnmZdhJS5T8a9J2YTjybjrIYzS6hLZIh
 nL5cXgXDOhPF90jHYgMhGwEd2ZnGS1fV2r6GBhQF/Q7sVY1BihzimDEveLzxVVzxf0HQTJpHVCh
 221jBg6SicFgnNhRWCc3rC7xq2meMSb83ZU7VsX+//zeYRkXaul4WVah9je+S3KZKMO+oF/ftoz
 i4rKy1VFER6b6sDLoB7NZnb/w6YHagzEqU/l4eJX1d+Pln/4M3fFF4j6/wRqDnR2vg/j0ZDYSFy
 9v3zfnQS4EQvDQ8hlwpIihQwi3J0hbslXz6cBX2j52ZkqDHxLlz0+oemgpymZL26b+uy9HM1scs
 878TfG6juEq1xem0NPN9qg/RNoAIJvpcSVuY7GvQpIuhUls7RTEsP66hmXBzDHsiWyT0JcwcdmT
 I85JZ214lz0nIiKwZvw==
X-Proofpoint-ORIG-GUID: bWjbO_tZ9E3KBUKAR4YTpnIkAVXrVyuf
X-Proofpoint-GUID: bWjbO_tZ9E3KBUKAR4YTpnIkAVXrVyuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> The Qualcomm SM8150 HDK can be equipped with an optional display card
> having the same panel as the display card for SDM845 HDK. Reuse the
> driver submitted at [1] and enable display card support on this HDK.
> 
> Unlike SDM845, this also requires a new LCDB driver, providing voltage
> for the panel and several fixes in the WLED driver. The FSA4480 address
> fix is independent and can be applied earlier.
> 
> [1] https://lore.kernel.org/dri-devel/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped WLED patch, duplicating one of the applied patches (Konrad)
> - Rework the WLED auto-calibration patch, also dropping the reviews.

The latter failed to complete

Konrad
