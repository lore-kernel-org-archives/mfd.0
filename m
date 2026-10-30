Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368956;
	b=oD+ZGryLW8DCrJQVC2aRRq5vVmQW8zjG65b33lVmah6zXEHXexnWyQwTjhhQCLmS2z38
	 /H09ZfTzq0m4I2xckrxDk6i3ni/zkuxviLsUE9gF+3Ak23OMwNPdQ1G6mlyur3hh31h6O
	 BUoEPz25iALXIbCuYvFTeamrm1cb1YiyuP26s7gQPGLvyHFomH3NyoyZHxbX36PdNjVZ8
	 oAN6p6ZqGHd1uN7C7jPRx38SSvk/8DD3a0Py9iqgqPneqaUVX6zZ8j7wx+kI5cb+FfQuF
	 DAaVyRm0UCxm7X65XYq2jOC3PGU4DcJjzJzzXxJTxCep9tP5SAbHWVS27mK+AYCGG/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
	b=NOhplS3SIHDQay4KK+K+pQ9/6bH2OS7KKTbRrDt36v1besJwqbQrO7RWvi0QAtP7/7WM
	 oD4QCEVHmoX/ABOgUL5auJnvD1YKIsZaILmoSTh320FUqKuxYm2anl566fW8ln5Dh4Oym
	 CHVFwaYuT9pyI1arm/DIChQE+mqKj2AzCN7YxvcsQSbCSCvuLPFcVgrE2eN2daFNpmRrp
	 yNDyNPxx+clt4U2dC6BFYW7DoEhnSD8Kyffc7xFv5/f2HEuNJjDrAQbqdZypghYaWlkzh
	 1kFocAU3xYIj/Ha8LFi9rfgxNX3DUHHsN5WSEKRr124v3owXsCmGbWe9H9sK9hC5FYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqjFGRzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="P/N3EDpm";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DDA606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18DDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqjFGRzf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P/N3EDpm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn81k3479758
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=; b=EqjFGRzf/gwkWbvG
	dqk/FZNrc1/HzxTW59nTpZrbFLdJeiJBsjVGWy9qKqEwiue54I75NBcWFtPBESfB
	1k+rixQz1SHx1zeBKvTdw5NX9owTe2RCUnpbM1NaUFnaO6/ZmD1pxDJJq4Fsr1sO
	TWmQjwSZ9DIrSZueS9Pdnmc0HypoPmfMlkB4hNDSgbAWHvpTL6qsjjRIQErJ050k
	VYS/qFtDXPSBXDJ1shKgsacT7ssLaH8bQs61yqUiayHLmANTOg1KLKdxXnCTcYcT
	nRXtg/VrvWMM6Zqok4PGXJts2pKVFsV7MRXzJUM8tg+zkCsOWDu8w3VCeU7J1Qhe
	jBqEfQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkbdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec2ea00c42so666583e0c.0
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368954; x=1793973754; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
        b=P/N3EDpm/xEpYE67noFP1Ws8c/R+VECjInBC7HqKyjrUsZDi8liO0KEEEPcfvKk1kx
         berGolvXgrogyouHcNWSbiqmP459siPJBa7xo+6karNgZPvfPDMHSwxyJi+yD3ofTDCb
         s8GJAqmQuP0oc6Dcg+c2XgmcTUYppGdjF106z6732T6l+TSvbcXnPmP0IyHFJKnWh+H7
         wiCXeKUjtsjxR1XNHrGcInXeKhq3spYnvXig8XI87AO9F5dj3JC04gg6T9HdjzhEcz6X
         SFnAUB/j7LTfZxZYhvfkYZzXcxeam5wewV5bGki2scHqbKjHXUXBSAs0QYUcsIbwF8xq
         2LfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368954; x=1793973754;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
        b=uf27Hiq3+YS6ZmJd0WUnnfnfrNgCjoidsop0nV/dkU2EtQ0qIrF4QbqRjN8YmQdDoh
         vN2+KzkAIE/qAOwsTastNLzbcBp1yaxZcPv5iFP6tOIrlGMFUa9RCTXzbVpS58im9xia
         wHzSFe/MCujZT4uP0xYXEUS5D+G4xa+Gx5Ht8QlHea2X7wo53HdavOwsPNYDJy/bRNOk
         ORU5Gc5LWrDO/IHlfY7vv8bbwsmYBOfg0b6nd6BA4pb1vUT/lvZDxxgMR7UJZYDxpq96
         FCXFzt6Ri5eZLbKArk9NxPuNvDrsZF6Y9h/WWcYfHwTeyPPDfg+b0XD1bK8PvhriXuWU
         Ft9A==
X-Forwarded-Encrypted: i=1; AKwUvBwaNMoZ8+d3kSG7zEsvvYG2YF5Q68jAG4TLLn6Blj5JBDPJJF7jqccwSJVLMq2bRlJmsCw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJzE7/Z3Ck8GrRJRnqYNuMhrSwysx4U6HL3Iu6Ntx/vs16iizQI
	DzrwB5pEVpbS3bFstL8Q2Pwb8P0HplJjnk5XeN12zUJZZh1KwHQM/siHfPVyCIsO4oCPp8PgHdu
	kpZl4SvTai5YOT3XbALAz9Iz7TCsAPMKngJMSkvTRdchmvgbKHomIOdg=
X-Gm-Gg: AYBFou1ziSimLxstnbX8eHKGlJSTAUKFNf1y9YA1arePCBFS0tZE7ijYuX5OY4jCvRQ
	oypxdd08I2iXe7J0STMx9jP5d6Qxj6mCppFNhsqB5SnBuZpuHItlpcFw3WNd8M3yJ1GBoCRutvz
	Img4TzEdnBCCkrlg4soB2V5baetwCMtHkz5kBmSY5FnWFZj1j62abS4jLojetxtNRZ/c+7E45FU
	PNQnZkmd/V7w79ZvTEq6ssaMRz/9MxIrB4jDMg/E0e5Ug492iMpcgqOePWbkZcw6NUXyLHEh5Ov
	0Py8Jn637unkzvj+TV4yii1IfsJNQZqbpOZWRyZEF1woMDJdF9xItUvOBj4b99joPhm/D23AyjQ
	jYQ+tUCgvEq30wFF2yXsas6NvKxT0qErOdGBeUf+P2KtgAZeXTojAoY6MsdTQH/ZCRgRCu6jbe/
	4=
X-Received: by 2002:a05:6122:3115:b0:5ea:ca0a:374d with SMTP id 71dfb90a1353d-5ec587af5eamr1871313e0c.17.1793368953066;
        Fri, 30 Oct 2026 07:02:33 -0700 (PDT)
X-Received: by 2002:a05:6122:3115:b0:5ea:ca0a:374d with SMTP id 71dfb90a1353d-5ec587af5eamr1869535e0c.17.1793368934913;
        Fri, 30 Oct 2026 07:02:14 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e719eec22sm3808245f8f.0.2026.10.30.07.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:02:12 -0700 (PDT)
Message-ID: <256cbe11-86ae-49e7-b7d6-0b0eb23a79e5@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:02:10 +0100
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
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner
 <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qGAIp-xDdaxgeLsHpdAeG5_323vPMeKo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX8azupzaHvrnn
 ukQFDKBitd7nBDvpFf8YO9d9mnOYj/aCy6zbqBk54w25VJGq92Udb6qbY/IIsv8eS/vUu3v6Zfd
 VsytPmUoOmh5JecGniEvllbshveIIAQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXzU7L0U0BKbjz
 qVh+2ECbg7tqVHjuft8Rd9bziLdQGcO0YSRD3umFmD6lPTuQefrh+rGweqlZMcGdmgtEZqXdywJ
 R8OkwAhuWHnXPvRt1GBTNuFSRWXkzPGNx21NNHvt3sSSRZR3ldNRPdxQ/v2yO+V49vvwv9G/88i
 zMiOwZjC9ibBCUC0rIwSd3iNnhtq2m0h6XJsg1+mTrhnOSgzF9Z3ZSnP/O6z1Nku0cw5n2gWucM
 a5fzdz80rKDVENmK/1mnDU/ZZ+vHzInQVxMKJM5dX7v7X2nAn2rH9uBKGTrFeX60xs4TwsplikM
 PV+6eosy2/i86MLWvQNizt33oUAD5KCoencHHXHw9cTpHhCS9fELUUtTcHEkrPmmCdIMqlj9Ngh
 9TpLvZGmMWwGjK56qraDYqAij7a/nQ6zdXc7XjNoLYrw44Bah+BnK4fw0bLJH98nHI1xVsfXERP
 /fijmokN9P5yB4baFJg==
X-Proofpoint-ORIG-GUID: qGAIp-xDdaxgeLsHpdAeG5_323vPMeKo
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4a37a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c-0_0CVZb4FivoHw4gkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On 30/10/2026 09:47, Thomas Weißschuh wrote:
> On Fri, Oct 30, 2026 at 08:11:38AM +0100, Krzysztof Kozlowski wrote:
>> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
>> can be constified whenever driver does not modify it in the probe.
> 
> Looks like a candidate for scripts/const_structs.checkpatch.

I think no, too many false positives. 1/3 of drivers modify the mfd_cell.

Best regards,
Krzysztof
