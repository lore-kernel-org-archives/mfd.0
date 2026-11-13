Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556334;
	b=LTFDbiBXccazPWZAFD8eJMhjBhSQrj4UuTy6OOlR06i5qwuUMvkPr+XeoV+QUtVEACL1
	 UwEPpDXdxV2MVZqBbGidfeLr9XbXC4v23WB5xgP8MqLV26bDJmytssW3YnTzVa0FdSjkC
	 qQqNkQF1q2rHVnOYjtxUnS6hSBf5Qv4a0uEfFUzVHa2ILiKezwgZqT1h7U1nK5T1pQ86F
	 8/yICRh86D7yYYNJOY7Nonr7xnBBz+Mg4zYWNORnkfxrrgi7StQW4E8xX7L/e19vPTI8m
	 BLK0RRa/GY0zL02thoJ9+AFQXN+iFt92x4k+K0utjTF79/U8/EecSbI/AiEmR6NesIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
	b=Cj89bTOyv1fvRv7R8K2R8/B8iGrBYyJPgjQTSzHHQrdsBjxHztRu4Sr0nuOtqojnJDqo
	 l2YJ2cKawHjnzYSkX5xo9I7Mj5RlEa1qwja1sXo7ENDTnQgy+al69p6IHZcMlMsO4+H0U
	 CTzzox0uuBJET5lH7Nr/wpIiiDt0zuh5zwGLYP3pKGUO55O05wrzRBkk9Q1IBq62FGNI2
	 zfBwdpYkwMn3zflhO6gIGZwaek1qGFLoYYfvJiND63kCqxRpfhpCMqI5X1JVQGhpy/rPq
	 xCmuLj8vU4hQSLetWy/T0Yzi8GApdaFtycic6cvlWCMpe6Kc10CoVrf/B2vo8Ellhqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZuOW4sg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cvDS7xYU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D4606A88D
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 07:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E19D4606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZuOW4sg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cvDS7xYU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD56wZZ3717187
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 07:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=; b=MZuOW4sg5PQHC5L2
	4VDBN9eTZKi8L74ybienDF5TNJYsIHiHGcUYzmDmJ/npqbJLtLd+yWLbWxc9qfE2
	1BnXTMbpxk4+SGrznbWAdDAzTZxA9/EQbO2GjkPP5oMgfXDW66ah6F5t3EcDnL1v
	eY15eOIMffTxDHq4/8sM8L7HrCM2KO9YreYQ1vs6t2YydhbsDYNIiEZdCo81NPeF
	+5tneyhCZWgyz/GpPSJrDyIahyK6n4lfcWwyLcqYRLKLfZI/W99PEBvAVNEVHDof
	06v7fWDexadkbKXZL25ieiexSxIowDHbmg+aNLi5UCeG3AnLGMyqz5tcMQbxwaG1
	VUaf0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhc7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 07:52:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533962f6bc9so1755061cf.1
        for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 23:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556332; x=1795161132; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
        b=cvDS7xYUDHIMaZX0vlIZezyAG6UxPBH/E91Ky2+tlpbkqQ7jwLPVNwNwfpupM3btt8
         Qj8yOkBdI7DqVekFnQPbH0mnXcfiIdJG/ZRb9pBhQ7TpJQXd5bUGtJAGW++ffSKzFbnM
         7+DL2uz350GxvOBBXSpLgdZe5mltM7oNeke3Hbep7Yikt8T/fJS5RU0YR8hVzyBoSSaz
         zIxlBw/JaRecU9HC7rcAPynrbQXolkrywKUWdn8uWXB4YeQKilpAxYRK6nKIJTikd30X
         nsRndEwqnGpDa3WKKBqPdd29PWgtGnRIdb7+UQJFyNW3i0QDyiXOI1feTA1c11hOgWzR
         g9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556332; x=1795161132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
        b=aMF4ASC5XXNWwXZex+oaRsPFysYMzvotK3da0NQuGmwuvx4X6fSWVnLOXXqlhm4GwH
         n1Q6Qw170Z0rAhgi4aXWPR/r169Ejj1Rr1O4xLCkLvsKcgWZ8Y4H840ehq0r7CXlJMJu
         SD1itaY8tz489B+7wYbEE4FM3flgRxQ0xn2KHAaaFaEz6o8OhumgKYDCHP+Yk/XsMByY
         6hRl5MWK08qQg8H6mMK4kV1iYeXt+hWGIt17zsAnJj8Lf9A7hVy7HRzo+eAik5SL8Kfs
         +Iptza9QPoSvR7EpZ8NOVjH7AVlmafOHhsyerm0Kkc2/u4gladbNZm24Xo5FxP097Zi+
         CgDQ==
X-Gm-Message-State: APuU4Z+/JQVvcDLvZGGBll2EMD/KxqSIRPPEjnyLLlzC1WueJcENIf+j
	Iu8M6gGuMqP0yTV86shn6xXevsjbCHyn6RPc+GSkU6puukbAIpO8K7EN21M19jrnESEiDVtAzfZ
	rOAa8TJUmcpcL8Tunine9txxLbEDMmUtV79huv2bDt645tPu1ZTFco6U=
X-Gm-Gg: AYBFou1LcYMPv1t/KA2Tv4uFPUS3YUly8LvldiEIsq5i0IAUPiLMJ49J79M36DM7I7i
	3b6XQklc2RPuNh+pGpP1q8YPGDp5BjdWyR9tsyMb+sK0vQGpK3u+4KusKSDqh9LQC0Lgnuv30yI
	IaRlIdJ0ZYOcL/cVhg0TuLkyhJe+2bmmkHlNw9//r5qzW6L2UaWRb4Ge2RWOG+IsCJbzyjhrwDO
	L8D7AMicBqgRKKY27Yja75SstugaSHHG17bjLQj8PJh0GC2ZXRJHWgRIyTQ3WUW4a5JkotUjMGs
	WZ7+k5emQIim5IoJ8O2HFvaWLItWKaBBVisaoZRKwC6ivyZ5YUFUaOYPKaOZoh7/EyPSGiSNXzC
	kY0XwD+EMAwBxkHg2s8C0+Rkse3uG3vTALOn3YeVyi682MhasgtzvC9cDJrMaEEhDhUPzRXU=
X-Received: by 2002:a05:622b:1d1:10b0:552:896d:89b5 with SMTP id d75a77b69052e-55ac6b6e804mr27539421cf.3.1794556332156;
        Thu, 12 Nov 2026 23:52:12 -0800 (PST)
X-Received: by 2002:a05:622b:1d1:10b0:552:896d:89b5 with SMTP id d75a77b69052e-55ac6b6e804mr27539171cf.3.1794556331625;
        Thu, 12 Nov 2026 23:52:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236a6sm61945566b.28.2026.11.12.23.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 23:52:10 -0800 (PST)
Message-ID: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 08:52:08 +0100
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
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LU5QXrSnp1sOXp4pA154sOCnFSfg_DWy
X-Proofpoint-ORIG-GUID: LU5QXrSnp1sOXp4pA154sOCnFSfg_DWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX3gqHuM7qAl+t
 7KRtpZOPJJ30cMEn38r+Dgw8IPfGMDCPBFu25YDLPKoOpDFI41Ew4VGEKYEA5mtbKn2FWvvAs78
 PmkMHtSy1H4IQlSfurmB08C5PIxpEcbrR/ezkLz1hNOX0VwzLWkmJYvRzQYr/c3CLqzgknNw1Qz
 Rwxly48O6AnjkgMAUwFff5nstvT7xOSpcXK9L8gXGO9uS7RFQU8NJ4SFHbN0ul/Aasj9MhIgZoh
 zPGdob0QnX7URHWg85iUCYTwpUvHAkMKAacPn/nYdVWTuZybxF2504XGkxE9959ExfihZFabANa
 7n0npR/Ie6DnoDs2gnqO/zV/1V4dHZSbfk4CIxYccZtXBdUIE0wFE/d0uosMBgGHYlT39ZylWu8
 Y4IhzPHwI0Gax983X/nd3VNlXsPY+l/vFTSGmbHH5Op/7BvYYfFdtjbUGsKRkFQWlrLvPauEPXE
 2TFunCDXXvzBAISYKog==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6c1ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KM__OpKlO_rSzR-_7FQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX0hkXYirEV1xa
 4mndOUS4sjY2HBU1gxK3u4FXmbJGfMp/n2GUqK63ITNP5mcP63rbfykMuUFlX0Kqi5vX1PKYMfH
 thUUlIMGC9vHywcVTg2PHoW4xLoQ1AU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> 'syscon' nodes are required to have specific compatibles, but the 
> MSM8996 SAW3 nodes are lacking one. This series adds one.
> 
> The binding should be applied with the dts changes to avoid new 
> warnings.
> 
> Rob

I know this has been a thorn in our side for a long long time.

I believe +Dmitry had recently come up with some patches to describe
it "properly" - are they any different from this series, Dmitry?

Konrad
