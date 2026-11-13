Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571868;
	b=m0auxDugq4jHvstxLNPYox2QlgxdnqfG7SkF9A5u3bCws0Yt0n6NovRZQLYjnbZyMmrz
	 k6v08cEGD2rHQUTUdUudx4ILVXiOvIZiLVVZeLcFLpz2djRkG9k84APlrvdIID0KXGEfG
	 1hS0eobliNZZuij87TdHhUDM/TGO2tvOIPzU6X0apKpNzjyxQGfpUVcPPuidITySUHsRS
	 SCq+CiVpj8wKiexNZ3Y9TwEyqh+ZbqCMkC28lMxbxXcJlyj+Q1Lj3h5uABdZmrxs4svy5
	 pVlzYWezDkcJIca9AnXoXK+TVX8x0l+Y/VoFqVzSd3g3vz8D8OFLEFvdgQgII/B2/eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
	b=K1jFKpvVx9750ffl/ltRqnuBrNQhheyBEDjOsoUEbrNN40LQMjioi4ZyA+iQm5vKePNt
	 h3zI7Bl+KxK0aQy6jjMhFNPpl6+Hf4oYlaZiSwXp3QHKZ48EVsuOWdHYqnC6iqxRvSmNn
	 WIZbrjVvQI4QOZBtE8QJhwkgGEAsqeYjk3yPt7W+jorsONCCH1tRaqkElqaJnfHJV/5Fh
	 9lqBBnmbY7W3CsVHck176FpUGXEaejDfY4LsI7DANAQ9W3wnW+ofvaQSx7z7jAO0wpBm4
	 lo74DqipaGbvaQcQ863pJLhAesHQYHb9SPMJW+3ZPBg45jYT/1XYRgGG599fO4VOStw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ie9TzPzb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70700606A32D
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 12:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70700606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ie9TzPzb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC0RBC1471427
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 12:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=; b=TEFiQ7CgOeSRnQW/
	Se5AoZ7dU6cjjcaKCcUCdHvC6glfYOpUgtIi46FqA8lPXUVJgojFjfTr5Twfu4Mp
	CQbbN6g6pHf3PwdXgHahKEHyyYCJvFy3uK1ZrPlHyfhXCDZPXP7l2zI3/X6YRhr9
	P4cuWfILX/CScAZSIlXC+90djbPnxUYlMfurTNDWM2n9N5nRSr3Zm+vlX3pnFWhZ
	As8+Ov7kfmMtzFJB0joQo73uFu88E+LeiTT/JhxBaznhr2QHYE+waIvCpoMzvaU1
	mUm3VHg+zCXtMTkhyvJzq0nOEheAZ9Jegsrr/fM1r+Ndg83P6CJP2LKdzamirrDX
	+ZsSTg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g20cnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 12:11:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecf0967947so52018e0c.1
        for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 04:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571862; x=1795176662; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=ie9TzPzbJlLCuB4j6fi16LxgON4SXa49ATeG7vDTHSw+K2Nmx0qhVRyRtJML6HD61T
         U1mMtYc473J2tEErYa1NkBQB0PH6GFFFwhS5npoymeutI637fEVcJf7oHKtJZGOkowT+
         KtspGdDeHBkNQZromANK2TNfwe0SN6ZgImXqnx1TQx/2tf7i6SopSnd+SmiWMfWzKklm
         psaKrdhjnkJckk+qXuzutx0qBZikP2hQ5mYeHNfhV9PLVo4YUOJfkMSuBnExSmucWNDk
         10EaK4+vcXHJbIsn1xgQfLNNd3yDRi0a3wkpwHosJbbIoeiRVYHVHIqVBO128ZuQRGfO
         Xfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571862; x=1795176662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=sl3nFAFnzChPopgWVraOazzWQfGyu8i4WUdGnEoWZoHtSkF8lHXIGGuCNSaV2bsJR2
         4MiRB4nUp88WM1ZCs739WlPAYDYjksAcZ8LBEmfO172Fi2BSnx7quG2CgTNpJijkNyZB
         JzuSKxaJiEF1C3UTwlZYqYZYHXwRlP62ypHriwqmY61C1nAOiQpdbWpklJxPVsSoAroR
         avvxwWFDTFfyIo5hxgIbw5o7Vjrr4lxMd0+D5Q/zN7EkDNx3xm5joSwXr/IjA8f/LbXm
         JJTM70mmWYeu2ZZw1liaCrc3lYnSgCxV4cC9/T1l3PITIlcYuZntZDBjoPVqdKDXThgd
         SPtw==
X-Forwarded-Encrypted: i=1; AL+hErGtNKSohucAb5KUTYvOMEqK4j43x1vqbEyIlchNBmYQsQzb4fYVprOlZWFPbICJmEymNeA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8L8bnsAvr8towFKjeL2mVnPYt4B8bAUiDCPj225bH5PTmfia4T
	1cqTBgqJ7sHunulCVCvY/CISp9hKgFx6L54p1TBO86OHeVREcE7G7pXZ7nuyoRP/7lRsBvCM4Zm
	mTQmYaKdU2yZ0R1PgROeY6OiDeMhFWjlPYjnCgLVhXvzyLzU7QEHlc7w=
X-Gm-Gg: AYBFou2GFQJuBZkVARt8J9LkSsAEljnkJJI2U5GyHTUbaOEsZAgZwiMYEYDSbmDrrxg
	VxxHENoc3yCASAahh1fDKzjA7JnE49JD25RAwgcfF1QTsiACGivv9Hbgk8BQhhz3hLsnLC/m3ti
	jXyuBYpSUfE4cyyeTI+k8Nf/1eJe3bYthB5ByqJ/C36StvBtqip8qu6W+xKdyAPWcHfvuGlVUi4
	bVHOcG1O6eoSVjr75Ffx4ChjT4770X5e4HF3n5SuzaVoPwWkfrpJDs4hDlw/HmKHlH1lVMQ+Qi3
	6Z1PsoDxAQt7U5N4be7/sT6JtziFWBWq+OEPZyo+0L0wtI2TaATZsXj7iEYF6+U/fhywDgeB9im
	mzNFWdCorxtYdNUV3LfJPklGruPZ0AqAQSrpTBGS+7dCrs97YpM9JaDk8mwGWlCM0BfwLl4g=
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738721e0c.2.1794571861695;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738699e0c.2.1794571861279;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm86814566b.47.2026.11.13.04.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:11:00 -0800 (PST)
Message-ID: <03d75b49-dea4-4736-a662-27ef64682157@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:53 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
 <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
 <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXyupMV8I/eIny
 Gt4aIsjr+d5tDS0mDwD2eEt0IrOI6xgNaf6BZGJuI1l45a/pDldo9j5mCUl7OphL4RkYLC9UpoD
 dDbBePJbCxoYSsqR4uq4UX9rEmuztBu6xtNnuZJkv4TUYfHgI/oArcu/qiG3uSTtgxHkxEQO1Ea
 5M//wYGmTogybB18Qrogg6dar3b50OWok5JDmpkK+5NSmfYMRmd2l34bn7NbUQyx5Yr0HTVCvvv
 BIUctUt6mw8Frdlt1IDmLAJZjC4LH3kS5O0+CCjIuOJh4OU/IkEyTFV+/byMaxSecbcissBjLoE
 g3Y2Km37+4j+WRrPeH4de5sU0FngQikGiYX1mt49xIyFPZLI21fvwlUa10PneL8nZDRzrKWJBCo
 GypckzQlLqmUE2pJvv/73dlu2PORTeksv5/oPzV8hlvLDfabYoy+IXfSyYg0HS3xbliG4RrOOHH
 EZzM3jpXKQxKrEfJFRg==
X-Proofpoint-ORIG-GUID: scaWKluUG2XeebLtRsWuipn64CdKQWar
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX7LG9SBHVlsJa
 KmiuoIkqem7n34xV5SGVAlmIg+AfD2z6wW6U8PcdVcRIdehsbQFNsygAgsf7D91jvAE1ZNhYE/3
 Xe283NnkwMJ36/p+kemTh4a+D3L2rmQ=
X-Proofpoint-GUID: scaWKluUG2XeebLtRsWuipn64CdKQWar
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af6fe5b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VS6XN_di3_qKZAQ5k78A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130048

On 11/9/26 6:04 PM, Stanislav Aleksandrov wrote:
> On 09/11/2026 16:12, Konrad Dybcio wrote:
>> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>>> +&usb_1 {
>>> +	dr_mode = "peripheral";
>>> +	maximum-speed = "high-speed";
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> Is there no superspeed / dp altmode in hardware?
> 
> The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
> port, I just haven't brought them up yet. It seems we need a new driver
> for the Type-C controller.

OK, we can do that incrememntally

Konrad
