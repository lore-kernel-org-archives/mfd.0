Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421581;
	b=jFomFL1FntZdrMfTtbGLDbFks90l4XFKWetiLr2+CTIl/f4OzThs3SEPaLeC9x94SeCg
	 wGhO+/0U9/zIu+LREJudENXRLKWlWTjffxaalqBKcvWLC4m13TppAMmQA3KZdtOPTytf7
	 NyGjELETIKmm0QLIEUOrVKpfP1pfi4B1Eww6+RdVeb18jJTm4OVXd+1AzsvhWkDcPEB3X
	 nKL0WXydGadZiKPpNfGEkxZ4ulOrT1yj9a0r1Jqt2002Dl647Rrle6BQBiVNp2XVZfkqE
	 zF72Wf+5ql9/ILKOE/uJfY5igUT9mIkwjAz1NXLX2SNSSCnYTrkMAjWJ6+X/FHIPhNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421581;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
	b=0rME9muze1nRVFnvjDKNpG9RmyPC3LrJZzXx80g/J6t2DPgExnUEgAIumBIhmH+y/L6w
	 D1C7KCeekSYshOqYnwsgVxAbr7yYyu8Yw0/GjZw1vxB3VzcZ261us85xShskKaRYkRmVj
	 502D149IeRYLnxH0rSahHnWX24QBPlXz3i0CRc6hZSzzwkZosDI/bZSjadw4k/yUMzKgq
	 G7KTC68N80P4uv6l7UO9H8Tn/PoumfvzZcRPm/aLsing1a0wSlsvqgfM0ZmB4K09mqVh9
	 kwq9VgUcfOH0eHITYdjmIWmOMvB+0X/olP3gezpBG0K/b0rdseuc8/l8enEAAYeP6IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QG60Y24t;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F02606AAC9
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QG60Y24t
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E284C846E
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421581; cv=none; b=MJB9+/2Puzw+k+la1SxbQnqQ5f4cLyhvDQoYQajQL+LmLthaP3OAcmxSrDod9iDpuzNEmAmVX1gwnmVR78jPMLcoB7iZHv7hOxF3zV8a6HTscsxBx92OgYTeL5VAUUiF43KPkjdm+QsAfdq+mPhvQOfqcj44BD2Uerri+tpQo9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421581; c=relaxed/simple;
	bh=Q8ELXF6LLbtqADEm3zzC52Pu10rc3XpBpK4nD5ZwOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MB7APtzZWCs1XD527Dpr9cP01uvd5ujOBsAPL6ksKHtipqSlsHGUY4L2N4NpJDgXuly9Ji1kHWay4ylGdMth+9YARbLGPzSC+ZFUmzsEp4WVrcdTqb5bKkyMzzdMbz2JFlOyiYrIiZ5qMGQvRTtNiom5TaeGTrooqWR3rkgYlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pptyslek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QG60Y24t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0IV63401080
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=; b=Pptyslek4ttLiH5m
	QQHolh96lkqa5dPpnl2zIbUN3kvq6bimL1s4DNm1dlnyH/0sZcX4KF+RHNiH1m1j
	rUusEkRTyh3ZrSGbYObcBDDDiYINkGr/ciZ47ih2biuwHBVgJMtTpCbJi/OZIz8e
	g7YFqFwIkJqlHbzwVxk5EnaEdH86nUgvSWNKjVC7U+u84ffDstcwA7hiA7Jbuubg
	/DrgcdXgMkjFt7Nz32G1s6clnRTtgwtROq4IoIHIWizxKJVsXH1cAI97XZl8pYoF
	xVQqD7aiGnQaOcpq6kxo3XDpx4n0OfkZLv3JjD+jh/UpmkxtR0+J8ij+QYgb0mob
	6CkQOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1hh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:52:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso55334885a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421578; x=1793026378; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=QG60Y24t+Ab1XaPIOV3FWBcwABp1tTYitdWdHQevinfynqOzbpUOhXWTgAmzXSvYr+
         z6VutDFiNGcsGf2V/wVw5/4qKrAx4Co8XvBTEJT8GLvApO56GZADvJOH/xCnSkmkG1+t
         UW+Kq1jnQRkPsNBDG3gQZjQxJ1gooo3HjIUnpu/lda8HWJo3zrCl31ZnOBeoMhMwWNTI
         /j4mDl5x+zIG37kfYEMo716Lj4tUzA74/EYJ13DbKTfu0qqkB2ft4NR+qORzj5CSiJv/
         +RJmABsERfiFnPQq8yb+cNDIOqDy7qyk4oUkl8j/wCcqLH+JinWgrhUTQ61EF9lTm9bz
         NCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421578; x=1793026378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=s22BCvAWIJVYMKKoFEy/jerYAUXFgi4R0+1+rri1vYdvPnXb6xckfQth6LlnDoTGCm
         5baP25fXTaCzW+PxYAusb6Ul+Kc5JSrkXhB61QR2uekeruWv/fSKo49CDWVTahr3A8mh
         dAl7oRZIOLW7Es+N29gUjgC6/yNftV16Wb6NAreYb2mtyWi9CRbcUrN0KbHkZ+R5PusP
         38dgjSrqmW9Gh8CdB1M+7pdz077yWLgTgkro91orfQZWm+NP616Juj6/4cIVotyQP0t8
         ymbQ1QT+vwiA/6siZqVUsqe7YniPq7r5A/3BkTQZxWqB9b+hiYPwFuy3kA4ijxZdprXu
         AkzA==
X-Forwarded-Encrypted: i=1; AKwUvBxNBjdjcnjIYshsf3zzMpPB59cFC4qHeW13McDDeeLs8OJVY7Sb/tVwAMRbKXcWdFzAc5Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYKGhpKgElDbQDXDRNkmNQDLKYRSIR7BK8kKASiQB36D3flu7mUL
	RSsIpaGWwpEKIgnrH7jTRnXKlTqHlt6A4LkkpB/vFeDQvrpOV7x3bRVkOIHCipDOFVh2+QR/Wv9
	byYsSVE2w/k2QzK6Jl2Ieh2NLQQO4T6NfzPg3Hx2jBQKZbdUP1o2nzxw=
X-Gm-Gg: AYBFou39MjI2K5GfIywNlQaH7Rn58kKE/iDcvhFTxJRwfkuCuPinAJhVac+6zuMWEen
	Xsil20fWeaw2a7dEkuUGGHetv3TODkBnoOx8aq9jKce9c8rrdl0f1h9BJzYFe/nlsXxvzV6Y2Hi
	NS7lquM8EHEfLXnxOwywb6fjDXRw1z68C8yHXZ/riziFYLumzLbaRzRDcexYbk6VMAQrahFpzB2
	U52Uh37qsvFtdwUBrrXBXQxJeoHIaiRHlb4FJ4OrPOorB6ettbzclXwzXGjuEeLTEAHxK5G83nO
	PZC0LrdkfMTdyOnGB8lXVUhUMjouWfuMKeh7gnk9Qf3DWJUymES5FtDnW/kNWIP7km7x9u0M8pk
	JQWpv711WxqT38SnmH3Q9bg==
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459381785a.6.1792421577978;
        Mon, 19 Oct 2026 07:52:57 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459376185a.6.1792421577483;
        Mon, 19 Oct 2026 07:52:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:56 -0700 (PDT)
Message-ID: <a334b115-6fac-4417-b6da-fd0a2e5fc43d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:55 +0200
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
Subject: Re: [PATCH v4 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
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
 <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX3WitMw3IpGsH
 w6QZZnLywkxbk7c0a3WKh4C/eCgr+B+i/oLnrfRmJ0dJBxbDsF9W9+hnoxx68Iad9M7zh0fAVUA
 M0hmTHhyNsh30JMzKH0n8Q34+N/KYp4=
X-Proofpoint-GUID: Y9rE6VUdSPWhdwr22YURJjEs63lbU60q
X-Proofpoint-ORIG-GUID: Y9rE6VUdSPWhdwr22YURJjEs63lbU60q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX/r98g/d/C4V+
 tLsRgsSPT9Mfnl4bhrDw4HAPmFXOMygV5f64gihYR32NMhKSTNLoIYbg7a7tFWJccMCR/Pq0TYB
 bk5fkEUqw3zRkVk67rLJcBsR1ECCOfB5z/cjXHRy43FNCbtNskCkp3cgcvtR4wNEBI4rjcKGeGJ
 mli9fFa3qImws8WPpto9cr8RRMz0FX8aC2V3ZMPr6sNgtn2mamrUsGSfCJF/zf0J1HNfUJyIyz+
 GnSKtEzeqSQflna4z75jXCm9pm4tUQj90pW7RGSUQA8eQjw0MRA35ByVxeFCzcMbZBKKZX1rF6d
 y7f3+S07JutAyORjKIcm4b+Bxhkp1oaqVaqSHgZTycC/Vv24fuIW2X3/5vnIJnvaSOFvzI4RdPQ
 1LoKiqCbq7ftRjR/Ih4XU5sWIF9o6jwJC+phr0f7cxZmzXX2veot5fafKA6h4/Xq1Ffgz5hba2Q
 dWZdb5bl2XTzvxZVK+A==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad62eca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
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
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
