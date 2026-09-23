Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418EF442396
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158668; cv=none; b=AjT/XdWZr5yPNDYOW3Hx66BoxO7kMAujTg8LDOi+aXShhMFFw127S+x0/dbLHRyeDxmiSVZp8cJShLaY3zjRmUUiw3f+Ixg/pgX+ixuWhB5bKth8s5T78rBUJPcOPmHP2LhNMORnjhj/wER7zbG2sqxyQpaXk9z+qTgDYqcRQDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158668; c=relaxed/simple;
	bh=i2uXn1FZn3BvlVrPjw6xo0wOO98Iz1Tsnj2g5Q160sQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwtdtvUhj4xD5y/8SJRySGnqZczzW6xTWNsZ1IKawP374fH9UCE0T4zs1cVt7Mf4a+YrcI45F3D2fKfe8e78VbPSSlInxfmEfgQCMkZ8NUNvmAZ6ypzX/Rwupeh6STz/HIjXBOlJp2UWfRAOtJ+720DF8JUj9L2YVr/MWMz4jW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfvR76lN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HO93N3ib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfvR76lN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HO93N3ib"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3Kri3566299
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=; b=VfvR76lNEn5TIM2/
	rf/KJaE1U27yn8qa6ciwpJ3RG30BybSEv0nlH/R8XTh94FWRMsq57QM9o1FK0xl3
	v4yBb5yM4a/9kE8Y2g7S5Bhr7FLDYPkJr2XtX8EOF0y0p1j67+MMXYyxpAl8ERH6
	XV8ezETpocxLF0mlxFRZSDhjscnGpgD3J3x5lqCP8hqY++7NOeP+yRM2fgg7pHdL
	OTj3ohzxRH+4qh037rN8RCccRfyz7G4ksOVvNMMrJWFxggZ3ahIH8SEo2qur/6Xe
	pQ9D3QDH8yx/K45spa3Sv3mOjHTratO7bnhdHlznOMML+bwYsHPHkaO1QiaeVgf7
	eExUtw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuufc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:17:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3286d2bac04so825649eec.0
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 03:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158657; x=1790763457; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=;
        b=HO93N3ibKo112fJXLkg7W+JrZntniTiHE0UPUe+o28ANiGpwfgd60K8FObQnkZISt9
         ZJ9D8tpTYL9CCVaXeuIjcY27wCgooXo4tya56CxdZJIS1ZCkBtIePhJrDITsja3fDhb/
         Gb8gBjkf0rUJSZS6FXFI3v8nMoMSkCvJ89Y6ZGc5KBqtUr9hl9PfrTBI8tlab9s3kmd7
         sYwGV5+aVMPjTPHpb9Mr8qKW6OTxGVACvc0BFg2YheihXNZuSQlffaOxyKtnkREFV1xO
         yYRUmEw1SnRH4IUDSEhUIFKBqED7p0lExz98YfYiwmcLNwooF9yOweg2+JKBuByH69rX
         xVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158657; x=1790763457;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=;
        b=omgD8kiGaFdxWrmw4aZiTLoHeXxBUK0ELuT0aT6jpHZdiGe3aJlwcJFdhUBprxKWvT
         ufZNcCPOOTpxPabLyLvHPyBgDp8f+dNjgE2zcgOBljunTaDKPtr6Zo4kJACtZUu4RZK5
         XOP/VqoplpGbjsfajFEpFWVf6uTQyrcxJPFuAEYMA7eMY69ezMgHrcDY7o0ghmg0TjcX
         OjipmTTIBPdR6B3MxXkpV/NRzBuiESfgJZajTtPsLzX3jeLEuG20nwneeZnfNCOlwmnq
         O5Yt3osnCHCyeQWNM5cLVIyxUOXU4AViC4T4stf355SnJMbaH3RLgFpgzae1y+YN2icK
         X7eg==
X-Forwarded-Encrypted: i=1; AKwUvBzNdFwkpVZHksGIRqorBamwez4Oc7xJBSlU5DLBDPTNu5y8YiGtXzY6yhPcnfxmT2uKYhQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nkbQXdzkEcPyXjSeeVNpd4ESRK0dFkvNDJJ74KOUOFlSUkJJRk
	9tP/EYCu9L3AWNu4Nezg4w4CDBWw5HHtRL3ycO5LJJidr6NaVG4z5U75J0Ka9hKxDTWwGm0zHYQ
	S5Ww3FfiSZhqtRmWk+Zv1IG6Rly14/4NEE09QWfyJNhSk6Zxy4b7n2pw=
X-Gm-Gg: AYBFou0Hsev7OMsYYG0H6ObXMaDHDtWmAcfSwXdXAn9l2AIKa2X9JBesxh8sikr7QFE
	mzo+Dfv/yuE5FNMUGdrDgnENfiRWmm+HHU8jRdMWihVpE1ltfOv1Mcfi6sATOHHqcuo0mumkKr6
	gSPMyQD9kSkXKobAsF1ES5ef+O3JMviZ5xCYG3Na4Sni6PFyTdCYq6Dcx6DyLNq0MwrASnS4CXs
	at+AcG+dVcX4jbWZwr4nzsho6eaWXQzcOtLt+uou60hwqSstRsSn4uN/chPd+JVqDEWaEnU4IGu
	XUkIBJGuXIbk+4nr03gIxAOvdmwWJeUiFJbHqBCiL7uJoEpvIMYNEiRskWt2XXLTnIw2FBFUeNa
	UrI1tF5tt4VYOSjg18eApFc5GvSkm
X-Received: by 2002:a05:693c:83ce:10b0:33b:7fff:dfea with SMTP id 5a478bee46e88-33e8c05848cmr2471931eec.2.1790158657075;
        Wed, 23 Sep 2026 03:17:37 -0700 (PDT)
X-Received: by 2002:a05:693c:83ce:10b0:33b:7fff:dfea with SMTP id 5a478bee46e88-33e8c05848cmr2471901eec.2.1790158656501;
        Wed, 23 Sep 2026 03:17:36 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:35 -0700 (PDT)
Message-ID: <3a25c942-eac3-4079-8ede-a41f45962499@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:32 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: qcom-pm8008: Add PM8010 mode support
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-3-de33d78fad9d@oss.qualcomm.com>
 <20260918165258.9FC791F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260918165258.9FC791F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QipglBlQfdQDFF1JmxC9c_rKjMl_uR06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXz6Ul3jbySyt+
 1moK4TG/s/RWZrwIjy2Qq40iUTxZ/EBRK3j1rhxX+UwlkfS0UP4FF+RVwuQY02nJSrUvQluWrMa
 sEa0Xx0cuq1oTwJHmvAwgnpSBOyuq0LEL5h07opoB0tpvFn6tbk1+hlq2JuUKTC1sowyiPrXWy+
 McPGllSN8F4e7OJwiMKzdc57lQuQgdAR1tgrO4v0vbKfaveb4AyOpDqjWyavFIGICRVZKB08hB2
 J21CBJl7Pbj0/v/us0D05ba1q+ZQs5p2+XO14XYNAmPr8ObewBCZOG3wh63vngdbYPISf2LrTsF
 ygsBDSUtnKOnh9qVmIDvHkS1X767wORu/OnweAfFKEaFQ5kgKD6aK/y6COlP/Xwk9rSQjZzN1oM
 Tl4V6dv31b/NZX7O1PSWnaacyuZipSg9KwAn1THr0NQqvKyfwd6FyuENRS5ekJfHp04gF97bTav
 g+bcsZ/NEhfj66W1ryw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX0VbYS6bm2ZD9
 AV6bEYlkTbrXN3shyUH2uSmXoeb5cISo72sN1jUVKk6eWkH9WH956Xp4mwIuDsCyA4XcFwqkVZ+
 /MdqJDyfN7zTeiJYn5Gkp993enkmH0g=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3a742 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h15mIm_vO2ZwhMLoIH0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: QipglBlQfdQDFF1JmxC9c_rKjMl_uR06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/18/2026 10:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] redundant use of to_i2c_client() when accessing of_node
> --
> 
> commit f34c6623337a92a1f38e24ae60d1ae6ced8eed2d
> Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 

...

>>  
>> +	is_pm8010 = of_device_is_compatible(to_i2c_client(dev->parent)->dev.of_node,
>> +					    "qcom,pm8010-i2c");
>> +
> 
> [Severity: Low]
> Is there a reason to use to_i2c_client() when accessing of_node in
> pm8008_regulator_probe()?
> 
> Since to_i2c_client() is defined as container_of(d, struct i2c_client, dev),
> accessing the dev member of the resulting structure evaluates back to the
> exact original pointer (dev->parent).
> 
> The expression to_i2c_client(dev->parent)->dev.of_node is functionally
> identical to simply using dev->parent->of_node, making the macro usage
> entirely redundant.

I'll make this fix in the next version of this series.

Thanks,
Jishnu

