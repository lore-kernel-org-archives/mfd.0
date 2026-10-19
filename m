Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421575;
	b=IfoWvZqGyL6Zofl7rWqVRaxnnHAwdcI3U93b/AdO9cf45kyeUJFO6PXojRryVPBFUqaN
	 vyNViBsgdXZWTaJ3rwCr3oNFq88Dto5YYg50SoVaVJCR9O7/73deJL/tXLlWQJrF52Rjh
	 BaHBY2dBJTZ06cZiHP+wCoTsmLytuMhFYjtRvdEyeyzgIebfQ6hKMXkfq9ebuNwHs335Y
	 jRSRuhxKIHvdHo4EUKMPosWIJxSER5ngPWrSLy7WxTicOYgLL8ICVPxRmVNV2Sd8uwWB1
	 wnzWNidjZbjV/wT0XmUQEUnda8J1WxgriXdvPaDRb2hwlszQI6TvkFrhsk/V+ybmOWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421575;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
	b=i9EqEa81Fq18Y9t/mQRydwOvKdHq+HMyjzUB1v1o2hCE2oX2ZyEoT70L/zM6FnqOrUba
	 5wWOo/+9cfdeBkuFK6Z1ke0PAKG9sXKeVW5VuNJImosLBIXwg5qfvs79MB1d+n9f9x9GN
	 wYU3/Jrl4Td4S166g06R5YQgAlgswbZVrVopaFke/ncOOKoxEjSLLNWDqTjHsDXN+bYLu
	 A9iRRf6g4ajp7CGt+H4javQ+2Vth7weKjsNetemoX03YrC+WZwKTQPWaTYaAgQ0GMuts5
	 Kt8Ts+NUpC9HsDF4z0OlVPEyQs1ARRPlgom08eufUvd0Xu4rV8QtRltZhh11gBsgVUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o0H/27FL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kDyUrcL0;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57240606A33A
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0H/27FL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kDyUrcL0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0263C4C8461
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421575; cv=none; b=PQV3i95FCb7ATV9bx9hA58p2BM58IDKn5K/A5dD1w2buxGp6SqdR7nkQdn810RGnmeTALLVBl6PFp3H8Djp8bYUYXlpnQwCvJF5cK4wLTf459PT7CBchmwbH0kx5Ra9Qx1zu4i79v8c1lcE8PMcNk3uNB8LBEOluuuy/4Zpnquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421575; c=relaxed/simple;
	bh=orrAvnQKodrO0KGN/q1mi3EWkwR/z2Dn0RbWC+AZp4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bb88yRXUara6zRZ9LWErEJGGLhD+gL+zYKsVyMkvgX/TEPwDU38r6Yryf9+J/2u+GJFt/VSFhr5IHHAR9zEQA4ViU26X9cIulHqVouIMdSJOzjdZxwRDNRoLkbn+uTHjHpl3ILCRjxklqwadUQEzpnrxxsZlUWRWfFBoplyOhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0H/27FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDyUrcL0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0MfR3401433
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=; b=o0H/27FLsKCbcENd
	zuuZBR/4NyfyMNXLYkNG7wfXWl9TJQc5wQtIiqdnMyD4LVcYUO/4FGlBTHEoFGCn
	0mphYX1DZ4I3PFbjQD7EWFndAtFiXABmnzyH52QPRkSUWDYyh5DwbV3k13KMCwT2
	3WcoPqGuke8/owFkINPYH+7vF/NzXVuUx0IMwlkS3cbRZ89zwqbOvvEE3uSr3XBS
	nMV113UEy8Z+di+Z+3/ftstE2Wx5BXjBwzEaAV69Cahegn8ggIN0zO2Ydk8+nuJ+
	SRGSUyi3yQXU7aWoYyqXPX1e8+GoPOO4jyLalOeZ76xjuCEdaBILAyMIhgOwm6Nf
	KkOWpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1hgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so24471085a.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421572; x=1793026372; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
        b=kDyUrcL0kbWyhUn4OGhZxKZr3Cr6R3aJy3VIdmL0KuzSnPhfFQAm2/zc4Ypg+yGJeF
         GlHOagJv8bJRAixiPFLW28qWWvS/8rieqIz1dxeG/hnEbFNT0wDJhiAwx7Wx0mTgo8mB
         uYMQMmPflCJBDkosGRwldcN6zmndaRmf/QTVNrMU9/2yjQ4Fs1CdVlqM71Y3TzImNIEh
         s8UT+pPfgj4xqPffgSza9SzrSEVTCeKzCJdM/bwA3vyqo8/G2EqPuVQ54LCq+q/2jnnf
         0XCzex5uZypVp24ptx3Ijve4JuJKVm4ZdL/seqRhSB6QKqfWBFaW+5WAC+aFkayKvVcX
         s8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421572; x=1793026372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
        b=VuPENatJb8Bq/7b/OZtjvoLf5qYPqLriv6zY8ZgNitcsKv5sZgxuv1SfAHJmNGZCf5
         F4DD9F5fnhihXgEk9MLaGQuMur94nCPXN6qT5wOqwfcsQRFmyYX7mkFq2ntrrEMv5L4e
         Vivizr2peSM+iirPgK4afAFSqTJEc2zVFAjVVo24mI4Xd20D+qC4NkVdsr9R4G/1tou3
         yXQMlUXYsqEhJqYvbK7YCvhZlmsKYOmTWWKHvLgh2qNV++7iC+NLxtdkul7A4GhYPT9c
         3xrE7cVQP1B9lISPTU2xb12bGShF0a9g7NlZekXn6kEoMx8nSYNwowoZFUSnWlU443t3
         S21w==
X-Forwarded-Encrypted: i=1; AKwUvBx35vTPcFkV8+VHY8juBV7tngYz+/W7Yz7J7y+2ZWicHYPieAZ8SMph1fq8mpx8lQAwRCw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKyjv89eE1DW7/6EBtzUS1WciW8Sj2fq1hUSTNO33woIs+3LStY
	K2NYes/bmmR7SXFKYStoMtIJSNTvesAHGvmG74AXHnrgbkSzxWn8OlR4bHHVJ+oTjWQdR7IHJ4s
	AFx3/+277JOqY5tqMel5P42Nyah/cuCJnPwdtLKoCpEhNb2XmzZK0Jl4=
X-Gm-Gg: AYBFou1VNEyHwabHmrBHLfMtXQK0MAyvf4H3kYa1avcUTVIsd+3wN3EWmKNb5a5PHmO
	vnHS0hM/xdSvxeAuH+fZAL9tiSo0DSxe0eRwBW2hVZ/VSV/bG880E9Xdu49GhOFKcS/ByFXSLyT
	vGmHBBvvlQw6peepTvWF/5pfUNRYllYXWXHaSpXV4L3n3uJZckRWjX9cfVwcxjDTHqZS91cL5Ie
	LDNXQoMoOMx1Rljpm/RHVvGLADFdBxHRdewcmPHnC6ZueFFlWndixasY6+LTL/hMir4kmVwaL5d
	5AFRFSPLwouO7QCApdRlTUo4WHDPwXG260//V0pyaTZY2Hu/RT0sreLyEA1DlUQq0kaN+2STpaF
	ebyLvbkcK2E9G77OV9irImQ==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1420800485a.6.1792421572218;
        Mon, 19 Oct 2026 07:52:52 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1420796285a.6.1792421571699;
        Mon, 19 Oct 2026 07:52:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:50 -0700 (PDT)
Message-ID: <40bdd031-1d56-45ef-905c-32e706376d01@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:48 +0200
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
Subject: Re: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
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
 <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX3Fz3Hudyxrqu
 +QdA3EuD6lkOA6nSncGydBrXVKCDAqYDdF4MAiUthlVfwdl/Ykj6XUyrEyp1vzXCJ/xAXs5+Xek
 zj0+KKL6RgzqhQm2njUarn1BKjkP+3U=
X-Proofpoint-GUID: vQzYc2_XaAr3l1JyFBybBa9yCeKI1_Jp
X-Proofpoint-ORIG-GUID: vQzYc2_XaAr3l1JyFBybBa9yCeKI1_Jp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX14Yw9JJrX+dU
 EN3giIjH0IoMzv+gAk20/mFzQ39TBFZFG/xJAosvqo9TCA/FYxA7wTdmb0QNHrEYSA3V2GgFOEL
 ne7qYCamjNQbvITegoESHAJ/fGj1/8JT1euYIuNwzekTTYf3LzH8fJSXgBS+0qay2WUNksqcgid
 JeTgdiXoviMxZ2gPcxjj5PwvT0ChSmupStGHzdJV9NBkcVt8C0pkgBsfLTJmPkaY/oq6TH1NrKv
 Li0wfAfaTF2zW0nuX0vpuZVRbcQZ3nHwY9nQvAeVB1se0YMb5ocETqHVu/9cWU8ki33yD/YLM1S
 qwlQ7ri4lu4FtU5DOxUE9hoaconcYX1cxbBoKTswRcC0tZlKdMKjp/cFGwchNN2bc3H/725Kk+F
 l1y/+zWZSImplwRHp9QO63XJDuZoa5+4wokxJi2G4E6QajqHys7LRQN8ilB1+tYdW1xQnooxRrA
 o/An9wgnDbnrxJztmZg==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad62ec4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
