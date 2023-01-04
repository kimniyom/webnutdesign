<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Branchmarketing;

/**
 * BranchmarketingSearch represents the model behind the search form of `app\models\Branchmarketing`.
 */
class BranchmarketingSearch extends Branchmarketing
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'status', 'flag'], 'integer'],
            [['ref', 'create_date', 'confirm_date'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Branchmarketing::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'status' => $this->status,
            'flag' => $this->flag,
            'create_date' => $this->create_date,
            'confirm_date' => $this->confirm_date,
        ]);

        $query->andFilterWhere(['like', 'ref', $this->ref]);

        return $dataProvider;
    }
}