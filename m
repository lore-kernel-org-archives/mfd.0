Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B38219E8
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687987; cv=none; b=h0N8EOGH3y8Eew9eYezhxr11GGaUENsDI51tMuQD0GdoOddHXe2mNSS/crTireuaBTWWg+lfi61VsqKmya8wrq07Df3qWM+5nkxWwk0QZZJkVlnFia2iTgN9KyXTo6KosgHMfxYgVuLftR733pmg+ht8VM3iRFM/Huobbqekcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687987; c=relaxed/simple;
	bh=O0ihVgcmW96N31WjaekfKFoFrDNfaoWUpnrojK/kPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gta/7sVsoFCpkrbStqEGCDZJGR5zJkrrBN7z3KWdJrSS/sN910Ko/WNLt+ruFaMXg7HhZEIbmrMZr5JHQoC8kQM+Fd+qUsp5d/yZXSV7bw3/1DnCwRwXSXqRD8Pgu6tPDUoxHmfqiEcYv1QwLKAE0L6BtBdOaGafkF4jrJV/8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlHzN4oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+G1YIgn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlHzN4oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+G1YIgn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqnOF3842907
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2SaWLLt3k31dyNE7WFRzNl2
	f9XMQ7VloVYpaAtanfM=; b=TlHzN4oqB/ezUHQHeXfCDFgi4nzSCw28zqyr8Qt6
	U3fYQZPuXk+FID/DS6lX0cxOVWvZneMpq3aTdYlof3Dz2EfjaPLS1KcEGderFqG0
	AXFZ71yDrrIvur7qAOKFJQIOGEleTV74HfbrxC+nKTTTmUoudDKU/HSuChUd7H+C
	8NildQB+6oDGiiPWOAt5VguE9cg2BUXlSxoU8ZIRWAF+pAAtybVDNUoHHa0iG335
	J14wx6trFoDgdCfDwXj6N4lNuLWx9e6ir34mNOOROFCN5HqUTytwb1eHD6StS3dp
	F2aTHtNwlbzeUUPQXRl5VO/9owlc3ePVoml5Pc1fUIx3OA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8v2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:19:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b2d35b3550so3322785137.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687984; x=1791292784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=K+G1YIgnCjMCMB5KMCFTjjLayYvV3cDCD54ge+B/r/ea9iiaSlWMXMQqjHETCzP7Ko
         FHAgJuIthxdVJZKExL3ydiC8K4wKJofrPtb28JGo/qAXNnA6s8c4EBc3WHCxZ/dvASuQ
         uWcsB9CL58HHrJQUmiZHSszf14Hitl5YjmE6RIwnGauEdnBgjH3yINA8v0PN+l/oltJo
         YgSuvAV03e6JG0NrAOp+Ox7a4lkZ6z0IW73nd2ad/mq4GIEp/7WPEYQKC+R0+gTHPfdx
         p5Jba6ZYx14l0T7Bm1Ni6wX5oVNtJ24YlHX6eiIFdVusjhwFjcVOk+6ZgLoEVgfEbjaW
         MhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687984; x=1791292784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=B8TyoFaD+iKtVmGwu5Qw1cgGTsFyBWQISKcSps8+ccHDfTNcqpcC6ZbxV2MYZw1tds
         Ic3gh8GGE2/ThTVjZ9SDktjDjk7ucFRNnP9Z91U7GQZX13pcgpcMZzgm3QfnqlCh5RuI
         4w2iiF6L18EreGXinbmcwZvfDaKL3nqq322XHZVRVbLDHxlhEtAcl888l3To9Xsld+uF
         px1dGRJE4VgaQkPA1WNqLBlkjdRQOqmehOXiqSbl6pvk/d8T164MC3DMzkKCyo9cF6lb
         pejWsENSzq92cj0c97Dgycs85MZm1CGiPoN7Nvx5JwTpGRJEJaHlBozvdiyTFUNK3OZB
         WKbA==
X-Forwarded-Encrypted: i=1; AKwUvBwnWrYg4+NBt2qPtnbz55P48Ia7YHjyccp0YqP9nOoPETOpyqnHVLM2+656LIUxfEWxvRI=@lists.linux.dev
X-Gm-Message-State: AFq9FYIo4eCbBWeWZel+FAp2GsBQKZdZV6t7/4dwRIHjb8TtsDj5Yhw6
	9Zt842UlkijxttQZ9ZJAPUR96S5ndxpIis3plFaTFn/rn3N9y7FQjjo97SqQTWpSRSJFLKfm8hm
	/b6/CIlr2+QoYmKeH4GgFKtyVFFLeOb96HmgEmZDk9Y3I5ds4SoH4SC8=
X-Gm-Gg: AYBFou3cA9vxzHdoI0Zs20x47CVC81nLjjUqvgsE9sBXzsOcmz8uZ6AJKp1Q3tC+TY2
	ca0nN/uXHcdbs1WqYzXc8ZmyiiiBS7FW1H5/MDrNn7R0S19lx12OfcNdXbJgFPi9VidIsyyigiQ
	il0c/+o0Z6uWhJtZ+YrfYJffHLtG0LwDnHQRWroW1VimIgzJqNEuD/dwniJxVFCk6isT1asb2Gw
	h0bTbvtRXOegcPA/d877DC8Rf8hTdh3YgnzotcroPUKSvi/jNMi+5BOvgFBGgZquUSkZVzflVYG
	CHby3R6xmxlnqAxludN2SARcd0Rb8TJZsYcgCSXymr1egcsDEnEBDyf1M26FsQAP2VaxkW60HRm
	KR5AyHOdKYZQKNjw=
X-Received: by 2002:a05:6102:84d0:10b0:7b2:43df:ca51 with SMTP id ada2fe7eead31-7b243dfe78fmr2908991137.27.1790687984161;
        Tue, 29 Sep 2026 06:19:44 -0700 (PDT)
X-Received: by 2002:a05:6102:84d0:10b0:7b2:43df:ca51 with SMTP id ada2fe7eead31-7b243dfe78fmr2908970137.27.1790687983594;
        Tue, 29 Sep 2026 06:19:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfecb39sm85112185e9.7.2026.09.29.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:19:42 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:19:40 +0300
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
Message-ID: <x7k2cumcciponrgroymvh65r2dqgagxd3gaxgem3di4mcaeriw@njn3rc3jwbbd>
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
X-Proofpoint-ORIG-GUID: jwVE5zz8Vxtlvq6Lu09x1dCP6QC_20Oq
X-Proofpoint-GUID: jwVE5zz8Vxtlvq6Lu09x1dCP6QC_20Oq
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbbaf1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX1C7aWFdoQxa3
 p8bmeRm8tSF0OgGkLTbLigbVMBPC7QyicQeuvSD0xbo8NIrwitFk1FGqFOdCKTd/02YG46lMUWV
 dU9LrVXP3uQ7rQKpM84HoKThXPJtAKokdiudxtMnHaByWYLEgy9oF8qR5RY10oYRLZcUbf08ejS
 ZI1q/4FIyx4OCeHWBK98bLuaaNTq+8pfvp3kBMfCEkTeY8QmvYRP0VBK8Pzc64QekzVsAqtFYEN
 vFRvl5yPLmGTOb5kq7fx0E3lXfDhEBeaOkTCY3YEf4kThTYeVe+db/SEz47q/mm1cK7XL8LsiBP
 URoaCXG7JgdFHvKl6M/i1tZgutnqCGpDOTqUQgTQHCcLEoia13BJymlx9tSSR+5KaCVzIRddIJK
 kHIJdXPRWHbf1TLlQlVJ+N6/fvGAvTq9IwBMJ73BH5/lpp+L5vtPCvJOdHbRjOYTwlW2AX/MBbR
 XnYFrIUYqNJcUZ5xutg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX004Mp55D+yUj
 fMAnojdJ9zzAnSgEP/Vx5LI1e7TkxDEMfipA1SbpZdQCyGlD9ar5lMta2qDm9rOd3W+dJEcYVla
 Oj3TF3+XonnJOsnDNohc6lv9d04M4Ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:41, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
