Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBCA457E5A
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980381; cv=none; b=K0HI8oGliVzqzMK9fPnym3gqbmR1xLmVM9EXBtxgeCvNJZ40Ij+FxnfNIwlfZpj6Hg3Rr2HiJXq1TbGz7Gazu9irNSwX22x4GYYuXovupB0TzyrNBH1kMLF9AcyX9sx/RkRli/yE8vDMXTl3RneY9zmJXhYo/YHEA3poD/mhN6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980381; c=relaxed/simple;
	bh=H/Oq7DCmmKlvAofUgjpQ4iEZ6GqCaDK/Q4LrOcGlYX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMoBkSw8NWccxsPQkmSQgZECtte1TG4KcetjwyBdjo6L0fLjsU4OAqMDKmgLRbP95Nkl3rZ3C/GUjqwRtJrbgUs71bvJWvEwYoJ6LwC4TZgmuSP6WgWmFt9VyowOKyKdWVuAtjwbPzZJG99wO11jMqScv5Zf1kzqwVWYEmFwu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHtH7cie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caPI64yO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHtH7cie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caPI64yO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A3Ii1458726
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 08:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkBaXHoqMiFvjYL8zM/mOnKS4OOJMfb5HsorDcVrhUE=; b=kHtH7cieHkVvlPt4
	amzlnKDl37IMwUn9NHB4e7xhpEeyJ293VQGD5i6HA24E12l+KpTEDyY8I/EFs0Dv
	xYAvDI+A6eJMp0UEmRmYdW9WxPXs98Fcg8neSwBNeD2YYVqRRbqE7RQDzo8oW8ks
	uUF0fK7SiLd0zv42+y9VlJgffgggRTzXWA8FBd2mndCIVNWbWMtNmRi1KQyEKZ8G
	cuEv/0n3gWYUnzzbxXKxIworWDeYJOsuP28Sc+HQ+X1rPCdOseKB01QlXpTNOccW
	n9o0/rjFtjf4xavMGQbrtO40u6HnMCgegUm3rde71VoOD5AsMMtLFBg+mdjFynV3
	aKMkVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v9g9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 08:46:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9392788b3f8so82578085a.2
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980377; x=1790585177; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkBaXHoqMiFvjYL8zM/mOnKS4OOJMfb5HsorDcVrhUE=;
        b=caPI64yOGRfpmnWVdqFa2MichE9m/SfBE0wWw7TrdkeVVro48MSaud1kgnjl0AH3VJ
         lnIdialrouyIyuSPys7dxLzKqF9ZCoNTgAi6L8vwjBokvet0yFsqrYhPYBQ3O6cW2fUM
         4RBVIVKnzVhNd5dpVVbINz4a8LBfs+WUmu/MQ0fdyxUjZ0RrTRWxgKCmUdq9v6BVbTTZ
         7JE20Y3iIgVSM4w2kJ8z3KxeXMAnsi6t8odKTNm2r3/4qdrIwuFKpikVRLA/1K08nJU1
         UFov6TmhSMH65Uq3L7AGO9CMaIioTb6F/sgnl6ex2b/3L9iW19Wjk/i94eYA9TYuE2qI
         aRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980377; x=1790585177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkBaXHoqMiFvjYL8zM/mOnKS4OOJMfb5HsorDcVrhUE=;
        b=fbq1zPAIFq9c7zyp8V7fbAkoalSLZxneYHwN10+cDctcYxx4aVPAB/o+CiGPwwR5pA
         OTZcMXUGa5mAWN94AcQv9jLFHVVcDyK+YSAPfkVN+EMUumm13ir0HSfauT2GVhOTJ3LD
         6bruJETrmS1mi3RQJfM6+XFR2kqtW6u4gdV1XRj3E3Kbyemnl4Ck9rsc+VV8Ssb74fxh
         5CTogIV97jfNKcjJEgmq/xpwT34fdExkcOBQ5hfv+6nHGcy4WZMcOGnZ3+MeAKLc+WZJ
         ZNARWyGkjlnvQUuanphqzz+drV6iYVxAm/8zUy9G60ZJgzl7KrmoHrc4jmGEfFus0qvK
         3/Wg==
X-Forwarded-Encrypted: i=1; AKwUvBxLBmAz1oNPMIsxckwXzPeyXHWL/A1rixNmcWq9Z2/WsfPRIy4msU5vQdGX59OyqzKeQE0=@lists.linux.dev
X-Gm-Message-State: AFuF++mRkGjcCkDkhpG+YiM5Jzk4nxu6UFf0EhCwtfHgCeFgDOPQD9WQ
	zeEvu/R3jmaPiBffeknluwuC5MkW15G3fVgB5g8hpbZNw47/1ZqD1ISSko+7NP6ncaQqCLE0eIH
	88hOoLQm4OnOJmcnIf5ChfPYQt9eGSp7ki6On8bUkIwghI1IT6bY5jTY=
X-Gm-Gg: AYBFou1PUJnRKyW4CcRj7xhMt1soVgofvCmNFP713dXLjv6aje34cL6lVyDkoWdMtMZ
	M8RMxhh31OadNSK5OVntAvtn59SVv4wtG3Ee0qwNQl8LX/z1LTwf3x6JBdgqV2RhbfR3s1ur4qa
	SjxXkYzo1G3swOoIR62rMWbKZpuSQ/MTv8WSIXW/vLT31c40KVjt8fS3zXaB2mrAb0EZpov1zqX
	+u8yJK2Jzsb8ljbM2OqdEIvsVygXx3+wKm+K9XhZwAmrDUHYoHANBR6c/Q/XhLicBOZoDRDEJnQ
	rMNsjfuLUXx2gq8mCckIFZAz1n3nV+nzGwT3k7NF+fLKam0tvoKibB97Jr+DTGLnWNXLsIGxR92
	yBqyMwFo2tJ2dx6sipw0pXg==
X-Received: by 2002:a05:620a:1729:b0:93b:c6ec:780d with SMTP id af79cd13be357-93bf57df974mr940248485a.5.1789980377347;
        Mon, 21 Sep 2026 01:46:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:93b:c6ec:780d with SMTP id af79cd13be357-93bf57df974mr940246585a.5.1789980376913;
        Mon, 21 Sep 2026 01:46:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358ade5asm270916366b.51.2026.09.21.01.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:46:15 -0700 (PDT)
Message-ID: <733a3b6c-4278-405a-be52-0bd22ad1584d@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:46:09 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/19] clk: qcom: Add global clock controller driver
 for MSM8952
To: Muzaffer Kadir <muzafferkadir@mainlining.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260916-msm8952-initial-support-v2-0-798c2602dde1@mainlining.org>
 <20260916-msm8952-initial-support-v2-2-798c2602dde1@mainlining.org>
 <af3f7261-e4b0-42fc-818d-80e760cddc2c@oss.qualcomm.com>
 <a47a1a0e-559b-410c-aa99-9230908c2fe6@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a47a1a0e-559b-410c-aa99-9230908c2fe6@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0eeda cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IpRBMZr9S9mwpYgRR9UA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BPg9wuIdK-_3-Z2oVB89GLYd3MioYc8Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNSBTYWx0ZWRfXzdb4xcu2TcKd
 J9Kl2Nrd7exp+k81RnoKGF+TyhGPowyIJ5t1OQQGo+RK9e7NZNfRCTMxotRIUSFstDq1ka1U34V
 cbvpRTD6G9QU8+QiR4m7dgTPTp6oTyI=
X-Proofpoint-GUID: BPg9wuIdK-_3-Z2oVB89GLYd3MioYc8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNSBTYWx0ZWRfX8CECTrnahzuo
 ofNmh3yQ029korbS2BxUGDYyS+9RPLZH7NODzEV0sW/MufVIigdvarwWPPYCvXcHcJjQisSZ7tk
 FIPSxomZpHvSHdrK3DY6srROEVUUJvexL03AcmaC80TMf4bMs+jVpz8Iby3gvNbtvSQT47KzsQF
 pJRlbaR+A7zdHkugcTQOM5daozTIjce4GmXFVJS2zPbmnxUmZsl4vDwhig/2M36qjP4QBkMclat
 3b8FCL5mbMDs7vsp+RKr0sehbM7cC7pcYGzF35m0VpUjIQPZ+OsT557Rvj12Ugt5yOkXKC8391e
 gkKwcp/ZEFdfOFUtgeXMOncwOMt36bwbffMl7lyy4lhwymf1ycs9/1IVTNUaFxeOMU6BFfSlGSc
 CtLBMpQ6ZOPKBcCGKfogU7g37WqEh1jCjPuw+9jNm76Jjt+Xgn5kzaqQpJrjKAmRlUFKSDL3E+7
 R8+vyNWUyoUYitfzyTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210125

On 9/17/26 2:25 PM, Muzaffer Kadir wrote:
> Hi Taniya,
> 
> On Thu, 17 Sep 2026 09:49:07 +0530, Taniya Das wrote:
>>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>>> index a6c676f68b79..3c3f27dcc68d 100644

[...]

>>> +#include "common.h"
>>> +#include "clk-regmap.h"
>>> +#include "clk-pll.h"
>>> +#include "clk-alpha-pll.h"
>>> +#include "clk-rcg.h"
>>> +#include "clk-branch.h"
>>> +#include "reset.h"
>>> +#include "gdsc.h"
>>> +
>>
>> Add DT_BI_TCXO enum.
> 
> Should I rename the clock name to bi_tcxo?
> Or should I use DT_XO for enum?

BI_TCXO is the Qualcomm-conventional name for the clock sourced
from the crystal oscillator. I'm not sure about the BI_ prefix,
but TCXO stands for "Temperature-Controlled Crystal Oscillator"

Konrad
